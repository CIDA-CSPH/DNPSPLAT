# Test Session Manager for DNPSPLAT Testing Suite
# Handles session state, checkpointing, and crash recovery

library(jsonlite)

# Load logger if available
if (file.exists("tests/core/test_logger.R")) {
  source("tests/core/test_logger.R")
}

# Global session state
SESSION_STATE <- list(
  session_id = NULL,
  status = "INACTIVE", # INACTIVE, ACTIVE, PAUSED, COMPLETED, CRASHED
  start_time = NULL,
  modules_to_test = character(0),
  modules_completed = character(0), 
  modules_failed = character(0),
  current_module = NULL,
  test_results = list(),
  checkpoints = list(),
  recovery_data = NULL
)

#' Initialize Test Session
#' @param session_id Optional character string for session ID
#' @param modules Vector of module names to test
#' @param resume_if_exists Logical whether to resume existing session
#' @return List with session information
init_test_session <- function(session_id = NULL, modules = NULL, resume_if_exists = TRUE) {
  
  if (is.null(session_id)) {
    session_id <- paste0("TEST_", format(Sys.time(), "%Y%m%d_%H%M%S"))
  }
  
  # Check for existing session to resume
  if (resume_if_exists) {
    existing_session <- load_session_state(session_id)
    if (!is.null(existing_session)) {
      cat("Found existing session", session_id, "with status:", existing_session$status, "\n")
      
      if (existing_session$status %in% c("ACTIVE", "PAUSED", "CRASHED")) {
        choice <- readline("Resume existing session? (y/n): ")
        if (tolower(choice) == "y") {
          SESSION_STATE <<- existing_session
          if (exists("write_log")) {
            write_log("SESSION", "INFO", "Resuming existing test session", extra_data = existing_session)
          }
          return(SESSION_STATE)
        }
      }
    }
  }
  
  # Initialize new session
  SESSION_STATE$session_id <<- session_id
  SESSION_STATE$status <<- "ACTIVE"
  SESSION_STATE$start_time <<- Sys.time()
  SESSION_STATE$modules_to_test <<- if (!is.null(modules)) modules else get_default_modules()
  SESSION_STATE$modules_completed <<- character(0)
  SESSION_STATE$modules_failed <<- character(0)
  SESSION_STATE$current_module <<- NULL
  SESSION_STATE$test_results <<- list()
  SESSION_STATE$checkpoints <<- list()
  SESSION_STATE$recovery_data <<- NULL
  
  # Save initial state
  save_session_state()
  
  if (exists("write_log")) {
    write_log("SESSION", "INFO", "Initialized new test session", extra_data = SESSION_STATE)
  }
  
  cat("Initialized test session:", session_id, "\n")
  cat("Modules to test:", length(SESSION_STATE$modules_to_test), "\n")
  cat("Session state saved to:", get_checkpoint_path("session_state.rds"), "\n\n")
  
  return(SESSION_STATE)
}

#' Get Default Modules to Test
#' @return Character vector of default module names
get_default_modules <- function() {
  c("ciForMean", "ciForProportion", "twoSampleTTest", "pairedTTest2", 
    "contTable2", "mcnemars", "runChart2", "ttestPower", 
    "wilcoxon1", "wilcoxon2", "descrStats")
}

#' Save Session State to Checkpoint
save_session_state <- function() {
  
  # Ensure checkpoint directory exists
  checkpoint_dir <- "tests/checkpoints"
  if (!dir.exists(checkpoint_dir)) {
    dir.create(checkpoint_dir, recursive = TRUE)
  }
  
  # Save RDS file for fast loading
  session_file <- get_checkpoint_path("session_state.rds")
  tryCatch({
    saveRDS(SESSION_STATE, session_file)
  }, error = function(e) {
    warning("Failed to save session state RDS:", e$message)
  })
  
  # Save JSON file for human readability
  json_file <- get_checkpoint_path("session_state.json")
  tryCatch({
    # Create a simplified version for JSON (remove complex objects)
    json_state <- SESSION_STATE
    json_state$start_time <- format(SESSION_STATE$start_time, "%Y-%m-%d %H:%M:%S")
    
    writeLines(toJSON(json_state, auto_unbox = TRUE, pretty = TRUE), json_file)
  }, error = function(e) {
    warning("Failed to save session state JSON:", e$message)
  })
  
  # Save module progress
  progress_data <- list(
    session_id = SESSION_STATE$session_id,
    total_modules = length(SESSION_STATE$modules_to_test),
    completed_count = length(SESSION_STATE$modules_completed),
    failed_count = length(SESSION_STATE$modules_failed),
    remaining_modules = setdiff(SESSION_STATE$modules_to_test, 
                               c(SESSION_STATE$modules_completed, SESSION_STATE$modules_failed)),
    last_update = format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  )
  
  progress_file <- get_checkpoint_path("module_progress.json")
  tryCatch({
    writeLines(toJSON(progress_data, auto_unbox = TRUE, pretty = TRUE), progress_file)
  }, error = function(e) {
    warning("Failed to save module progress:", e$message)
  })
}

#' Load Session State from Checkpoint
#' @param session_id Character string session ID to load
#' @return List with session state or NULL if not found
load_session_state <- function(session_id) {
  
  session_file <- get_checkpoint_path("session_state.rds")
  
  if (!file.exists(session_file)) {
    return(NULL)
  }
  
  tryCatch({
    saved_state <- readRDS(session_file)
    
    # Verify this is the session we're looking for
    if (!is.null(saved_state$session_id) && saved_state$session_id == session_id) {
      return(saved_state)
    } else {
      return(NULL)
    }
  }, error = function(e) {
    warning("Failed to load session state:", e$message)
    return(NULL)
  })
}

#' Start Testing Module
#' @param module_name Character string name of module to test
#' @param test_type Character string type of test
start_module_test <- function(module_name, test_type) {
  
  SESSION_STATE$current_module <<- module_name
  SESSION_STATE$current_test_type <<- test_type
  
  # Create checkpoint before starting
  checkpoint_data <- list(
    timestamp = Sys.time(),
    action = "module_start",
    module = module_name,
    test_type = test_type,
    session_state = SESSION_STATE
  )
  
  SESSION_STATE$checkpoints[[length(SESSION_STATE$checkpoints) + 1]] <<- checkpoint_data
  save_session_state()
  
  if (exists("log_module_start")) {
    log_module_start(module_name, test_type)
  }
  
  cat("Starting test for module:", module_name, "with test type:", test_type, "\n")
}

#' Complete Module Test
#' @param module_name Character string name of completed module
#' @param test_type Character string type of test
#' @param status Character string test result (PASS, FAIL, ERROR)
#' @param results List with detailed test results
complete_module_test <- function(module_name, test_type, status, results = NULL) {
  
  # Update session state
  if (status == "PASS") {
    if (!module_name %in% SESSION_STATE$modules_completed) {
      SESSION_STATE$modules_completed <<- c(SESSION_STATE$modules_completed, module_name)
    }
  } else {
    if (!module_name %in% SESSION_STATE$modules_failed) {
      SESSION_STATE$modules_failed <<- c(SESSION_STATE$modules_failed, module_name)
    }
  }
  
  # Store results
  result_key <- paste(module_name, test_type, sep = "_")
  SESSION_STATE$test_results[[result_key]] <<- list(
    module = module_name,
    test_type = test_type,
    status = status,
    timestamp = Sys.time(),
    results = results
  )
  
  SESSION_STATE$current_module <<- NULL
  SESSION_STATE$current_test_type <<- NULL
  
  # Create checkpoint after completion
  checkpoint_data <- list(
    timestamp = Sys.time(),
    action = "module_complete",
    module = module_name,
    test_type = test_type,
    status = status,
    session_state = SESSION_STATE
  )
  
  SESSION_STATE$checkpoints[[length(SESSION_STATE$checkpoints) + 1]] <<- checkpoint_data
  save_session_state()
  
  if (exists("log_module_end")) {
    log_module_end(module_name, test_type, status, results)
  }
  
  # Calculate progress
  total_modules <- length(SESSION_STATE$modules_to_test)
  completed_modules <- length(SESSION_STATE$modules_completed) + length(SESSION_STATE$modules_failed)
  
  cat("Completed test for module:", module_name, "- Status:", status, "\n")
  cat("Progress:", completed_modules, "/", total_modules, 
      "(", round(completed_modules/total_modules*100, 1), "%)\n\n")
}

#' Mark Session as Crashed
#' @param error_message Character string describing the crash
mark_session_crashed <- function(error_message = NULL) {
  
  SESSION_STATE$status <<- "CRASHED"
  SESSION_STATE$crash_time <<- Sys.time()
  SESSION_STATE$crash_message <<- error_message
  
  # Save crash state
  save_session_state()
  
  # Save recovery data
  recovery_data <- list(
    session_id = SESSION_STATE$session_id,
    crash_time = Sys.time(),
    crash_message = error_message,
    current_module = SESSION_STATE$current_module,
    modules_remaining = get_remaining_modules(),
    last_checkpoint = tail(SESSION_STATE$checkpoints, 1)[[1]]
  )
  
  recovery_file <- get_checkpoint_path("recovery_data.rds")
  tryCatch({
    saveRDS(recovery_data, recovery_file)
  }, error = function(e) {
    warning("Failed to save recovery data:", e$message)
  })
  
  if (exists("write_log")) {
    write_log("SESSION", "ERROR", paste("Session crashed:", error_message), 
             extra_data = recovery_data)
  }
  
  cat("Session marked as crashed. Recovery data saved.\n")
}

#' Complete Session
#' @param status Character string final status (COMPLETED, TERMINATED)
complete_session <- function(status = "COMPLETED") {
  
  SESSION_STATE$status <<- status
  SESSION_STATE$end_time <<- Sys.time()
  
  # Calculate session summary
  summary <- get_session_summary()
  
  save_session_state()
  
  if (exists("log_session_end")) {
    log_session_end(status, summary)
  }
  
  cat("Test session completed with status:", status, "\n")
  cat("Duration:", round(as.numeric(SESSION_STATE$end_time - SESSION_STATE$start_time, units = "mins"), 2), "minutes\n")
  cat("Modules completed:", length(SESSION_STATE$modules_completed), "\n")
  cat("Modules failed:", length(SESSION_STATE$modules_failed), "\n")
}

#' Get Remaining Modules
#' @return Character vector of modules not yet tested
get_remaining_modules <- function() {
  tested_modules <- c(SESSION_STATE$modules_completed, SESSION_STATE$modules_failed)
  remaining <- setdiff(SESSION_STATE$modules_to_test, tested_modules)
  return(remaining)
}

#' Get Session Summary
#' @return List with session summary information
get_session_summary <- function() {
  
  duration_mins <- if (!is.null(SESSION_STATE$end_time)) {
    as.numeric(SESSION_STATE$end_time - SESSION_STATE$start_time, units = "mins")
  } else {
    as.numeric(Sys.time() - SESSION_STATE$start_time, units = "mins")
  }
  
  summary <- list(
    session_id = SESSION_STATE$session_id,
    status = SESSION_STATE$status,
    duration_minutes = round(duration_mins, 2),
    modules = list(
      total = length(SESSION_STATE$modules_to_test),
      completed = length(SESSION_STATE$modules_completed),
      failed = length(SESSION_STATE$modules_failed),
      remaining = length(get_remaining_modules())
    ),
    success_rate = if (length(SESSION_STATE$modules_to_test) > 0) {
      round(length(SESSION_STATE$modules_completed) / length(SESSION_STATE$modules_to_test) * 100, 1)
    } else 0,
    checkpoints_created = length(SESSION_STATE$checkpoints),
    results_stored = length(SESSION_STATE$test_results)
  )
  
  return(summary)
}

#' Get Checkpoint File Path
#' @param filename Character string filename within checkpoint directory
#' @return Character string full path to checkpoint file
get_checkpoint_path <- function(filename) {
  file.path("tests", "checkpoints", filename)
}

#' List Available Sessions
#' @return Data frame with information about available sessions
list_available_sessions <- function() {
  
  checkpoint_dir <- "tests/checkpoints"
  
  if (!dir.exists(checkpoint_dir)) {
    return(data.frame(
      session_id = character(0),
      status = character(0),
      start_time = character(0),
      modules_total = integer(0),
      modules_completed = integer(0),
      stringsAsFactors = FALSE
    ))
  }
  
  # Look for session state files
  rds_files <- list.files(checkpoint_dir, pattern = "session_state.*\\.rds$", full.names = TRUE)
  json_files <- list.files(checkpoint_dir, pattern = "session_state.*\\.json$", full.names = TRUE)
  
  sessions_info <- list()
  
  # Try RDS files first
  for (rds_file in rds_files) {
    tryCatch({
      state <- readRDS(rds_file)
      if (!is.null(state$session_id)) {
        sessions_info[[state$session_id]] <- list(
          session_id = state$session_id,
          status = state$status,
          start_time = format(state$start_time, "%Y-%m-%d %H:%M:%S"),
          modules_total = length(state$modules_to_test),
          modules_completed = length(state$modules_completed),
          modules_failed = length(state$modules_failed)
        )
      }
    }, error = function(e) {
      warning("Could not read session file:", rds_file)
    })
  }
  
  # Fall back to JSON files
  for (json_file in json_files) {
    tryCatch({
      state <- fromJSON(json_file)
      if (!is.null(state$session_id) && !state$session_id %in% names(sessions_info)) {
        sessions_info[[state$session_id]] <- list(
          session_id = state$session_id,
          status = state$status,
          start_time = state$start_time,
          modules_total = length(state$modules_to_test),
          modules_completed = length(state$modules_completed),
          modules_failed = length(state$modules_failed)
        )
      }
    }, error = function(e) {
      warning("Could not read JSON session file:", json_file)
    })
  }
  
  # Convert to data frame
  if (length(sessions_info) == 0) {
    return(data.frame(
      session_id = character(0),
      status = character(0), 
      start_time = character(0),
      modules_total = integer(0),
      modules_completed = integer(0),
      modules_failed = integer(0),
      stringsAsFactors = FALSE
    ))
  }
  
  sessions_df <- do.call(rbind, lapply(sessions_info, function(x) data.frame(x, stringsAsFactors = FALSE)))
  return(sessions_df)
}

#' Clean Up Old Sessions
#' @param days_old Integer number of days old for cleanup
clean_old_sessions <- function(days_old = 30) {
  
  checkpoint_dir <- "tests/checkpoints"
  if (!dir.exists(checkpoint_dir)) {
    return(invisible())
  }
  
  # Find old checkpoint files
  cutoff_time <- Sys.time() - (days_old * 24 * 60 * 60)
  
  checkpoint_files <- list.files(checkpoint_dir, full.names = TRUE)
  
  for (file_path in checkpoint_files) {
    file_info <- file.info(file_path)
    
    if (file_info$mtime < cutoff_time) {
      tryCatch({
        unlink(file_path)
        if (exists("write_log")) {
          write_log("SYSTEM", "INFO", paste("Cleaned up old checkpoint file:", basename(file_path)))
        }
      }, error = function(e) {
        warning("Failed to clean up file ", file_path, ": ", e$message)
      })
    }
  }
}

#' Get Current Session Status
#' @return List with current session information
get_session_status <- function() {
  
  if (is.null(SESSION_STATE$session_id)) {
    return(list(status = "NO_ACTIVE_SESSION"))
  }
  
  status_info <- list(
    session_id = SESSION_STATE$session_id,
    status = SESSION_STATE$status,
    current_module = SESSION_STATE$current_module,
    progress = list(
      completed = length(SESSION_STATE$modules_completed),
      failed = length(SESSION_STATE$modules_failed),
      total = length(SESSION_STATE$modules_to_test),
      remaining = length(get_remaining_modules())
    ),
    runtime_minutes = if (!is.null(SESSION_STATE$start_time)) {
      round(as.numeric(Sys.time() - SESSION_STATE$start_time, units = "mins"), 2)
    } else NULL
  )
  
  return(status_info)
}