# Test Logger System for DNPSPLAT Testing Suite
# Provides comprehensive, persistent logging with multiple levels and crash recovery

library(jsonlite)

# Global logger configuration
TEST_LOGGER_CONFIG <- list(
  log_dir = "tests/logs",
  session_log = "test_sessions.log",
  module_log = "module_details.log", 
  error_log = "errors.log",
  performance_log = "performance.log",
  log_level = "INFO", # DEBUG, INFO, WARN, ERROR
  max_log_size_mb = 50,
  max_log_files = 10,
  timestamp_format = "%Y-%m-%d %H:%M:%S"
)

#' Initialize Logger System
#' @param session_id Character string for unique session identification
#' @param log_level Character string for logging level (DEBUG, INFO, WARN, ERROR)
#' @return List with logger configuration
init_logger <- function(session_id = NULL, log_level = "INFO") {
  
  if (is.null(session_id)) {
    session_id <- paste0("TEST_", format(Sys.time(), "%Y%m%d_%H%M%S"))
  }
  
  # Ensure log directory exists
  if (!dir.exists(TEST_LOGGER_CONFIG$log_dir)) {
    dir.create(TEST_LOGGER_CONFIG$log_dir, recursive = TRUE)
  }
  
  # Update global config
  TEST_LOGGER_CONFIG$session_id <<- session_id
  TEST_LOGGER_CONFIG$log_level <<- log_level
  TEST_LOGGER_CONFIG$session_start <<- Sys.time()
  
  # Initialize log files with headers
  log_session_start()
  
  cat("Logger initialized for session:", session_id, "\n")
  cat("Log directory:", TEST_LOGGER_CONFIG$log_dir, "\n")
  cat("Log level:", log_level, "\n\n")
  
  return(TEST_LOGGER_CONFIG)
}

#' Log Session Start
log_session_start <- function() {
  session_entry <- list(
    session_id = TEST_LOGGER_CONFIG$session_id,
    start_time = format(TEST_LOGGER_CONFIG$session_start, TEST_LOGGER_CONFIG$timestamp_format),
    status = "STARTED",
    r_version = R.version.string,
    platform = Sys.info()["sysname"],
    working_dir = getwd(),
    log_level = TEST_LOGGER_CONFIG$log_level
  )
  
  write_log("SESSION", "INFO", "Test session started", extra_data = session_entry)
}

#' Log Session End
#' @param status Character string indicating session completion status
#' @param summary List with session summary information
log_session_end <- function(status = "COMPLETED", summary = NULL) {
  duration <- as.numeric(Sys.time() - TEST_LOGGER_CONFIG$session_start, units = "mins")
  
  session_entry <- list(
    session_id = TEST_LOGGER_CONFIG$session_id,
    end_time = format(Sys.time(), TEST_LOGGER_CONFIG$timestamp_format),
    duration_minutes = round(duration, 2),
    status = status,
    summary = summary
  )
  
  write_log("SESSION", "INFO", paste("Test session ended:", status), extra_data = session_entry)
}

#' Write Log Entry
#' @param category Character string for log category (SESSION, MODULE, TEST, ERROR, PERF)
#' @param level Character string for log level (DEBUG, INFO, WARN, ERROR)
#' @param message Character string with log message
#' @param module_name Optional character string for module name
#' @param extra_data Optional list with additional structured data
write_log <- function(category, level, message, module_name = NULL, extra_data = NULL) {
  
  # Check if log level meets threshold
  levels <- c("DEBUG" = 1, "INFO" = 2, "WARN" = 3, "ERROR" = 4)
  if (levels[level] < levels[TEST_LOGGER_CONFIG$log_level]) {
    return(invisible())
  }
  
  timestamp <- format(Sys.time(), TEST_LOGGER_CONFIG$timestamp_format)
  
  # Base log entry
  log_entry <- list(
    timestamp = timestamp,
    session_id = TEST_LOGGER_CONFIG$session_id,
    category = category,
    level = level,
    message = message
  )
  
  if (!is.null(module_name)) {
    log_entry$module = module_name
  }
  
  if (!is.null(extra_data)) {
    log_entry$data = extra_data
  }
  
  # Format for different log files
  formatted_entry <- paste0(
    "[", timestamp, "] ",
    "[", TEST_LOGGER_CONFIG$session_id, "] ",
    "[", level, "] ",
    "[", category, "] ",
    if (!is.null(module_name)) paste0("[", module_name, "] ") else "",
    message
  )
  
  # Write to appropriate log files
  log_files <- determine_log_files(category, level)
  
  for (log_file in log_files) {
    log_path <- file.path(TEST_LOGGER_CONFIG$log_dir, log_file)
    
    # Rotate log if needed
    rotate_log_if_needed(log_path)
    
    # Write entry
    tryCatch({
      cat(formatted_entry, "\n", file = log_path, append = TRUE)
      
      # Also write JSON data for structured logs
      if (!is.null(extra_data)) {
        json_entry <- toJSON(log_entry, auto_unbox = TRUE, pretty = FALSE)
        cat("JSON:", json_entry, "\n", file = log_path, append = TRUE)
      }
    }, error = function(e) {
      warning("Failed to write to log file ", log_path, ": ", e$message)
    })
  }
  
  # Also print to console if appropriate level
  if (levels[level] >= levels["INFO"]) {
    cat(formatted_entry, "\n")
  }
}

#' Determine Which Log Files Should Receive Entry
#' @param category Character string for log category
#' @param level Character string for log level
#' @return Character vector of log file names
determine_log_files <- function(category, level) {
  files <- c()
  
  # All entries go to session log
  files <- c(files, TEST_LOGGER_CONFIG$session_log)
  
  # Module-specific entries go to module log
  if (category %in% c("MODULE", "TEST")) {
    files <- c(files, TEST_LOGGER_CONFIG$module_log)
  }
  
  # Errors go to error log
  if (level == "ERROR") {
    files <- c(files, TEST_LOGGER_CONFIG$error_log)
  }
  
  # Performance entries go to performance log
  if (category == "PERF") {
    files <- c(files, TEST_LOGGER_CONFIG$performance_log)
  }
  
  return(files)
}

#' Rotate Log File If It Exceeds Size Limit
#' @param log_path Character string path to log file
rotate_log_if_needed <- function(log_path) {
  if (!file.exists(log_path)) {
    return()
  }
  
  file_size_mb <- file.size(log_path) / (1024 * 1024)
  
  if (file_size_mb > TEST_LOGGER_CONFIG$max_log_size_mb) {
    # Create rotated filename
    timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
    base_name <- tools::file_path_sans_ext(basename(log_path))
    ext <- tools::file_ext(log_path)
    
    rotated_name <- paste0(base_name, "_", timestamp, ".", ext)
    rotated_path <- file.path(dirname(log_path), rotated_name)
    
    # Move current log to rotated name
    file.rename(log_path, rotated_path)
    
    # Compress rotated log
    tryCatch({
      system(paste("gzip", shQuote(rotated_path)))
    }, error = function(e) {
      warning("Failed to compress rotated log: ", e$message)
    })
    
    # Clean up old rotated logs
    cleanup_old_logs(dirname(log_path), base_name)
  }
}

#' Clean Up Old Rotated Logs
#' @param log_dir Character string path to log directory
#' @param base_name Character string base name of log files
cleanup_old_logs <- function(log_dir, base_name) {
  # Find all rotated logs for this base name
  pattern <- paste0("^", base_name, "_\\d{8}_\\d{6}\\.log(\\.gz)?$")
  rotated_files <- list.files(log_dir, pattern = pattern, full.names = TRUE)
  
  if (length(rotated_files) > TEST_LOGGER_CONFIG$max_log_files) {
    # Sort by modification time and remove oldest
    file_info <- file.info(rotated_files)
    files_by_age <- rotated_files[order(file_info$mtime, decreasing = TRUE)]
    
    files_to_remove <- files_by_age[(TEST_LOGGER_CONFIG$max_log_files + 1):length(files_by_age)]
    
    for (file_path in files_to_remove) {
      tryCatch({
        unlink(file_path)
        write_log("SYSTEM", "INFO", paste("Removed old log file:", basename(file_path)))
      }, error = function(e) {
        warning("Failed to remove old log file ", file_path, ": ", e$message)
      })
    }
  }
}

#' Log Module Test Start
#' @param module_name Character string name of module being tested
#' @param test_type Character string type of test being run
log_module_start <- function(module_name, test_type) {
  write_log("MODULE", "INFO", paste("Starting test for module:", module_name, "with test type:", test_type), 
           module_name = module_name, 
           extra_data = list(test_type = test_type, start_time = Sys.time()))
}

#' Log Module Test End
#' @param module_name Character string name of module tested
#' @param test_type Character string type of test run
#' @param status Character string test result (PASS, FAIL, ERROR)
#' @param results List with test results
log_module_end <- function(module_name, test_type, status, results = NULL) {
  write_log("MODULE", "INFO", paste("Completed test for module:", module_name, "- Status:", status),
           module_name = module_name,
           extra_data = list(
             test_type = test_type, 
             status = status, 
             end_time = Sys.time(),
             results_summary = if (!is.null(results)) {
               list(
                 input_errors = length(results$input_tests$errors),
                 calc_errors = length(results$calculation_tests$errors),
                 has_validation = !is.null(results$calculation_tests$validation)
               )
             } else NULL
           ))
}

#' Log Test Error
#' @param module_name Character string name of module where error occurred
#' @param test_type Character string type of test
#' @param error_type Character string type of error (INPUT, CALCULATION, VALIDATION)
#' @param error_message Character string error message
#' @param stack_trace Optional character string with stack trace
log_test_error <- function(module_name, test_type, error_type, error_message, stack_trace = NULL) {
  write_log("ERROR", "ERROR", paste("Test error in", module_name, ":", error_message),
           module_name = module_name,
           extra_data = list(
             test_type = test_type,
             error_type = error_type,
             error_message = error_message,
             stack_trace = stack_trace,
             timestamp = Sys.time()
           ))
}

#' Log Performance Metrics
#' @param operation Character string name of operation
#' @param duration_seconds Numeric duration in seconds
#' @param memory_used Optional numeric memory usage in bytes
#' @param additional_metrics Optional list with additional metrics
log_performance <- function(operation, duration_seconds, memory_used = NULL, additional_metrics = NULL) {
  perf_data <- list(
    operation = operation,
    duration_seconds = round(duration_seconds, 3),
    timestamp = Sys.time()
  )
  
  if (!is.null(memory_used)) {
    perf_data$memory_used_mb = round(memory_used / (1024 * 1024), 2)
  }
  
  if (!is.null(additional_metrics)) {
    perf_data <- c(perf_data, additional_metrics)
  }
  
  write_log("PERF", "INFO", paste("Performance:", operation, "took", round(duration_seconds, 3), "seconds"),
           extra_data = perf_data)
}

#' Get Log Summary
#' @param session_id Optional character string for specific session (default: current)
#' @return List with log summary information
get_log_summary <- function(session_id = NULL) {
  if (is.null(session_id)) {
    session_id <- TEST_LOGGER_CONFIG$session_id
  }
  
  session_log_path <- file.path(TEST_LOGGER_CONFIG$log_dir, TEST_LOGGER_CONFIG$session_log)
  
  if (!file.exists(session_log_path)) {
    return(list(error = "Session log not found"))
  }
  
  # Read and parse session log
  tryCatch({
    log_lines <- readLines(session_log_path)
    session_lines <- grep(session_id, log_lines, value = TRUE)
    
    # Count different types of entries
    info_count <- length(grep("\\[INFO\\]", session_lines))
    warn_count <- length(grep("\\[WARN\\]", session_lines))
    error_count <- length(grep("\\[ERROR\\]", session_lines))
    
    # Find session start and end
    start_line <- grep("Test session started", session_lines)
    end_line <- grep("Test session ended", session_lines)
    
    summary <- list(
      session_id = session_id,
      log_entries = list(
        total = length(session_lines),
        info = info_count,
        warnings = warn_count,
        errors = error_count
      ),
      session_started = length(start_line) > 0,
      session_completed = length(end_line) > 0,
      log_files = list(
        session = file.exists(session_log_path),
        module = file.exists(file.path(TEST_LOGGER_CONFIG$log_dir, TEST_LOGGER_CONFIG$module_log)),
        error = file.exists(file.path(TEST_LOGGER_CONFIG$log_dir, TEST_LOGGER_CONFIG$error_log)),
        performance = file.exists(file.path(TEST_LOGGER_CONFIG$log_dir, TEST_LOGGER_CONFIG$performance_log))
      )
    )
    
    return(summary)
    
  }, error = function(e) {
    return(list(error = paste("Failed to read log:", e$message)))
  })
}

#' Clean Up All Logs for Session
#' @param session_id Character string for session to clean up
clean_session_logs <- function(session_id) {
  if (missing(session_id) || is.null(session_id)) {
    stop("Session ID required for log cleanup")
  }
  
  write_log("SYSTEM", "INFO", paste("Cleaning up logs for session:", session_id))
  
  # This is a placeholder - in practice, you might want to archive rather than delete
  # For now, just log the cleanup request
  invisible()
}