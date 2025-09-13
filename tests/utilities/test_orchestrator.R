# Test Orchestrator for DNPSPLAT Testing Suite
# Main coordinator with crash recovery and resume functionality

# Load required components
source("tests/core/test_logger.R")
source("tests/core/test_session_manager.R")

# Check if data and testing files exist in their new locations
if (file.exists("tests/data/toy_datasets.R")) {
  source("tests/data/toy_datasets.R")
} else if (file.exists("tests/toy_datasets.R")) {
  source("tests/toy_datasets.R")
}

if (file.exists("tests/core/automated_tests.R")) {
  source("tests/core/automated_tests.R")
} else if (file.exists("tests/automated_tests.R")) {
  source("tests/automated_tests.R")
}

if (file.exists("tests/core/expected_results.R")) {
  source("tests/core/expected_results.R")
} else if (file.exists("tests/expected_results.R")) {
  source("tests/expected_results.R")
}

#' Main Test Orchestrator with Crash Recovery
#' @param modules Vector of module names to test (NULL for default)
#' @param session_id Optional session ID (NULL to generate)
#' @param resume_crashed Logical whether to attempt recovery of crashed sessions
#' @param log_level Character string for logging level
#' @return List with comprehensive test results
run_resilient_test_suite <- function(modules = NULL, session_id = NULL, 
                                   resume_crashed = TRUE, log_level = "INFO") {
  
  cat("=== DNPSPLAT Resilient Testing Suite ===\n\n")
  
  # Initialize logging
  logger_config <- init_logger(session_id, log_level)
  actual_session_id <- logger_config$session_id
  
  # Check for crashed sessions to recover
  if (resume_crashed) {
    recovery_result <- check_and_recover_crashed_sessions()
    if (!is.null(recovery_result)) {
      cat("Recovered from crashed session. Continuing tests...\n\n")
    }
  }
  
  # Initialize session (will resume if existing and user chooses)
  session_info <- init_test_session(actual_session_id, modules, resume_if_exists = TRUE)
  
  # Set up error handling for the entire test run
  test_results <- NULL
  
  tryCatch({
    
    # Run tests with full error handling
    test_results <- run_tests_with_recovery(session_info)
    
    # Mark session as completed
    complete_session("COMPLETED")
    
    log_session_end("COMPLETED", get_session_summary())
    
  }, error = function(e) {
    # Handle catastrophic errors
    error_msg <- paste("Critical error in test orchestrator:", e$message)
    cat("CRITICAL ERROR:", error_msg, "\n")
    
    # Log the error
    if (exists("write_log")) {
      write_log("SESSION", "ERROR", error_msg, extra_data = list(
        error_class = class(e),
        call = deparse(e$call),
        traceback = capture.output(traceback())
      ))
    }
    
    # Mark session as crashed
    mark_session_crashed(error_msg)
    
    # Try to save whatever results we have
    if (!is.null(test_results)) {
      save_emergency_results(test_results, actual_session_id)
    }
    
    # Return partial results
    test_results <- create_emergency_results(actual_session_id, error_msg)
    
  }, finally = {
    # Always try to clean up and save final state
    if (exists("SESSION_STATE") && !is.null(SESSION_STATE$session_id)) {
      save_session_state()
    }
  })
  
  # Generate final report
  if (!is.null(test_results)) {
    generate_final_report(test_results, actual_session_id)
  }
  
  cat("\n=== Testing Suite Completed ===\n")
  return(test_results)
}

#' Check for Crashed Sessions and Offer Recovery
#' @return List with recovery results or NULL if no recovery needed
check_and_recover_crashed_sessions <- function() {
  
  # Look for recovery data
  recovery_file <- get_checkpoint_path("recovery_data.rds")
  
  if (!file.exists(recovery_file)) {
    return(NULL)
  }
  
  tryCatch({
    recovery_data <- readRDS(recovery_file)
    
    cat("Found crashed session:", recovery_data$session_id, "\n")
    cat("Crashed at:", format(recovery_data$crash_time, "%Y-%m-%d %H:%M:%S"), "\n")
    cat("Error:", recovery_data$crash_message, "\n")
    cat("Remaining modules:", length(recovery_data$modules_remaining), "\n\n")
    
    # Ask user if they want to recover
    choice <- readline("Attempt to recover crashed session? (y/n): ")
    
    if (tolower(choice) == "y") {
      return(attempt_session_recovery(recovery_data))
    } else {
      # Clean up recovery data if user doesn't want to recover
      unlink(recovery_file)
      return(NULL)
    }
    
  }, error = function(e) {
    warning("Failed to read recovery data:", e$message)
    return(NULL)
  })
}

#' Attempt to Recover Crashed Session
#' @param recovery_data List with crash recovery information
#' @return List with recovery results
attempt_session_recovery <- function(recovery_data) {
  
  cat("Attempting to recover session:", recovery_data$session_id, "\n")
  
  # Try to load the crashed session state
  crashed_session <- load_session_state(recovery_data$session_id)
  
  if (is.null(crashed_session)) {
    cat("Could not load crashed session state. Starting fresh.\n")
    return(NULL)
  }
  
  # Restore session state
  SESSION_STATE <<- crashed_session
  SESSION_STATE$status <<- "ACTIVE" # Change from CRASHED to ACTIVE
  
  # Log the recovery
  if (exists("write_log")) {
    write_log("SESSION", "INFO", "Recovered from crashed session", 
             extra_data = list(
               original_crash_time = recovery_data$crash_time,
               recovery_time = Sys.time(),
               modules_remaining = length(recovery_data$modules_remaining)
             ))
  }
  
  cat("Successfully recovered session. Continuing from where we left off.\n")
  
  return(list(
    status = "RECOVERED",
    session_id = recovery_data$session_id,
    modules_remaining = recovery_data$modules_remaining
  ))
}

#' Run Tests with Built-in Recovery Mechanisms
#' @param session_info List with session information
#' @return List with test results
run_tests_with_recovery <- function(session_info) {
  
  # Get modules to test (remaining modules if resuming)
  modules_to_test <- get_remaining_modules()
  
  if (length(modules_to_test) == 0) {
    cat("No modules remaining to test.\n")
    return(SESSION_STATE$test_results)
  }
  
  cat("Testing", length(modules_to_test), "modules:", paste(modules_to_test, collapse = ", "), "\n\n")
  
  # Module test mappings
  module_test_mapping <- get_module_test_mapping()
  
  # Test each module with individual error handling
  for (module in modules_to_test) {
    
    # Skip if already tested (in case of partial recovery)
    if (module %in% c(SESSION_STATE$modules_completed, SESSION_STATE$modules_failed)) {
      cat("Skipping already tested module:", module, "\n")
      next
    }
    
    test_types <- module_test_mapping[[module]]
    if (is.null(test_types)) {
      cat("No test types defined for module:", module, "- SKIPPING\n")
      SESSION_STATE$modules_failed <<- c(SESSION_STATE$modules_failed, module)
      save_session_state()
      next
    }
    
    # Test each test type for this module
    module_passed <- TRUE
    module_results <- list()
    
    for (test_type in test_types) {
      
      # Start module test with checkpointing
      start_module_test(module, test_type)
      
      # Run test with error handling
      test_result <- run_single_module_test(module, test_type)
      
      # Store results
      module_results[[test_type]] <- test_result
      
      # Check if test passed
      test_passed <- (length(test_result$input_tests$errors) == 0 && 
                     length(test_result$calculation_tests$errors) == 0)
      
      if (!test_passed) {
        module_passed <- FALSE
      }
    }
    
    # Complete module test
    overall_status <- ifelse(module_passed, "PASS", "FAIL")
    complete_module_test(module, paste(test_types, collapse = ","), overall_status, module_results)
    
    # Save state after each module (checkpoint)
    save_session_state()
  }
  
  return(SESSION_STATE$test_results)
}

#' Run Single Module Test with Error Handling
#' @param module_name Character string module name
#' @param test_type Character string test type
#' @return List with test results
run_single_module_test <- function(module_name, test_type) {
  
  # Initialize result structure
  result <- list(
    module = module_name,
    test_type = test_type,
    input_tests = list(errors = character(0)),
    calculation_tests = list(errors = character(0)),
    timestamp = Sys.time()
  )
  
  # Performance tracking
  start_time <- Sys.time()
  
  tryCatch({
    
    # Test data input methods
    if (exists("test_module_data_input")) {
      result$input_tests <- test_module_data_input(module_name, test_type)
    } else {
      result$input_tests$errors <- "Function test_module_data_input not available"
    }
    
    # Test statistical calculations
    if (exists("test_statistical_calculations") && exists("get_expected_results")) {
      expected_results <- get_expected_results(test_type)
      result$calculation_tests <- test_statistical_calculations(test_type, expected_results)
    } else {
      result$calculation_tests$errors <- "Statistical testing functions not available"
    }
    
  }, error = function(e) {
    error_msg <- paste("Error testing", module_name, "with", test_type, ":", e$message)
    
    result$input_tests$errors <<- c(result$input_tests$errors, error_msg)
    result$calculation_tests$errors <<- c(result$calculation_tests$errors, error_msg)
    
    # Log the error
    if (exists("log_test_error")) {
      log_test_error(module_name, test_type, "MODULE_ERROR", error_msg, 
                    capture.output(traceback()))
    }
  })
  
  # Log performance
  duration <- as.numeric(Sys.time() - start_time, units = "secs")
  if (exists("log_performance")) {
    log_performance(paste(module_name, test_type, sep = "_"), duration)
  }
  
  return(result)
}

#' Get Module Test Mapping
#' @return List mapping modules to test types
get_module_test_mapping <- function() {
  list(
    "ciForMean" = c("one_sample_ttest", "two_sample_ttest"),
    "ciForProportion" = "ci_proportion",
    "twoSampleTTest" = "two_sample_ttest", 
    "pairedTTest2" = "paired_ttest",
    "contTable2" = c("contingency_2x2", "contingency_larger"),
    "mcnemars" = "mcnemars",
    "runChart2" = "run_chart",
    "ttestPower" = "power_analysis",
    "wilcoxon1" = "wilcoxon_paired",
    "wilcoxon2" = "wilcoxon_two_sample",
    "descrStats" = "descriptive_stats"
  )
}

#' Save Emergency Results in Case of Crash
#' @param test_results List with test results
#' @param session_id Character string session ID
save_emergency_results <- function(test_results, session_id) {
  
  emergency_file <- file.path("tests", "checkpoints", paste0("emergency_results_", session_id, ".rds"))
  
  tryCatch({
    emergency_data <- list(
      session_id = session_id,
      timestamp = Sys.time(),
      test_results = test_results,
      session_state = SESSION_STATE
    )
    
    saveRDS(emergency_data, emergency_file)
    cat("Emergency results saved to:", emergency_file, "\n")
    
  }, error = function(e) {
    warning("Failed to save emergency results:", e$message)
  })
}

#' Create Emergency Results Structure
#' @param session_id Character string session ID
#' @param error_message Character string error description
#' @return List with emergency results structure
create_emergency_results <- function(session_id, error_message) {
  
  summary <- get_session_summary()
  
  emergency_results <- list(
    session_id = session_id,
    timestamp = Sys.time(),
    status = "CRASHED",
    error_message = error_message,
    summary = summary,
    module_results = SESSION_STATE$test_results,
    overall_status = "crashed"
  )
  
  return(emergency_results)
}

#' Generate Final Report
#' @param test_results List with test results
#' @param session_id Character string session ID
generate_final_report <- function(test_results, session_id) {
  
  cat("\nGenerating final test report...\n")
  
  # Try to load report generator
  if (file.exists("tests/utilities/test_report_generator.R")) {
    source("tests/utilities/test_report_generator.R")
  } else if (file.exists("tests/test_report_generator.R")) {
    source("tests/test_report_generator.R")
  } else {
    cat("Report generator not found. Skipping report generation.\n")
    return()
  }
  
  # Generate reports if function exists
  if (exists("generate_all_reports")) {
    tryCatch({
      reports <- generate_all_reports(test_results, output_dir = "tests/reports/current")
      cat("Reports generated successfully:\n")
      if (!is.null(reports$html)) cat("  HTML:", reports$html, "\n")
      if (!is.null(reports$text)) cat("  Text:", reports$text, "\n") 
      if (!is.null(reports$csv)) cat("  CSV:", reports$csv, "\n")
    }, error = function(e) {
      warning("Failed to generate reports:", e$message)
    })
  }
}

#' Quick Recovery Check - Run at Startup
#' @return List with recovery information or NULL
check_for_incomplete_sessions <- function() {
  
  # Check for active or crashed sessions
  sessions <- list_available_sessions()
  
  if (nrow(sessions) == 0) {
    return(NULL)
  }
  
  # Look for incomplete sessions
  incomplete <- sessions[sessions$status %in% c("ACTIVE", "CRASHED", "PAUSED"), ]
  
  if (nrow(incomplete) > 0) {
    cat("Found", nrow(incomplete), "incomplete test session(s):\n")
    print(incomplete)
    cat("\nUse run_resilient_test_suite() to recover and continue testing.\n\n")
    return(incomplete)
  }
  
  return(NULL)
}

#' Clean Start - Remove All Session Data
#' @param confirm_cleanup Logical whether to skip confirmation prompt
clean_start <- function(confirm_cleanup = FALSE) {
  
  if (!confirm_cleanup) {
    choice <- readline("This will delete all session data and start fresh. Continue? (y/n): ")
    if (tolower(choice) != "y") {
      cat("Cleanup cancelled.\n")
      return(invisible())
    }
  }
  
  # Clear checkpoints directory
  checkpoint_dir <- "tests/checkpoints"
  if (dir.exists(checkpoint_dir)) {
    unlink(file.path(checkpoint_dir, "*"), recursive = TRUE)
  }
  
  # Clear logs
  logs_dir <- "tests/logs"
  if (dir.exists(logs_dir)) {
    unlink(file.path(logs_dir, "*"), recursive = TRUE)
  }
  
  # Reset global session state
  SESSION_STATE <<- list(
    session_id = NULL,
    status = "INACTIVE",
    start_time = NULL,
    modules_to_test = character(0),
    modules_completed = character(0),
    modules_failed = character(0),
    current_module = NULL,
    test_results = list(),
    checkpoints = list(),
    recovery_data = NULL
  )
  
  cat("Clean start completed. All session data cleared.\n")
}

# Run startup check when file is sourced
if (interactive()) {
  check_for_incomplete_sessions()
}