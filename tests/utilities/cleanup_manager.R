# Cleanup Manager for DNPSPLAT Testing Suite
# Handles file cleanup, archival, and maintenance tasks

# Load configuration if available
if (file.exists("tests/config/config_manager.R")) {
  source("tests/config/config_manager.R")
}

#' Clean Up Old Test Files
#' @param config_override Optional list to override configuration settings
#' @return List with cleanup results
cleanup_test_files <- function(config_override = NULL) {
  
  cat("=== DNPSPLAT Test File Cleanup ===\n\n")
  
  # Load configuration
  if (length(TEST_CONFIG) == 0 && exists("load_test_config")) {
    load_test_config()
  }
  
  # Get cleanup configuration
  cleanup_config <- get_config("file_management.cleanup", list(
    auto_cleanup = TRUE,
    temp_files_max_age_hours = 24,
    log_files_max_age_days = 30, 
    report_files_max_age_days = 90
  ))
  
  # Override with provided config if any
  if (!is.null(config_override)) {
    cleanup_config <- modifyList(cleanup_config, config_override)
  }
  
  results <- list(
    timestamp = Sys.time(),
    temp_files = cleanup_temp_files(cleanup_config$temp_files_max_age_hours),
    log_files = cleanup_log_files(cleanup_config$log_files_max_age_days),
    report_files = cleanup_report_files(cleanup_config$report_files_max_age_days),
    checkpoint_files = cleanup_old_checkpoints(cleanup_config$log_files_max_age_days),
    total_space_freed_mb = 0
  )
  
  # Calculate total space freed
  total_freed <- sum(
    ifelse(is.null(results$temp_files$space_freed_mb), 0, results$temp_files$space_freed_mb),
    ifelse(is.null(results$log_files$space_freed_mb), 0, results$log_files$space_freed_mb), 
    ifelse(is.null(results$report_files$space_freed_mb), 0, results$report_files$space_freed_mb),
    ifelse(is.null(results$checkpoint_files$space_freed_mb), 0, results$checkpoint_files$space_freed_mb)
  )
  
  results$total_space_freed_mb <- round(total_freed, 2)
  
  cat("\n=== Cleanup Summary ===\n")
  cat("Total space freed:", results$total_space_freed_mb, "MB\n")
  cat("Temp files cleaned:", results$temp_files$files_removed, "\n")
  cat("Log files cleaned:", results$log_files$files_removed, "\n")
  cat("Report files cleaned:", results$report_files$files_removed, "\n")
  cat("Checkpoint files cleaned:", results$checkpoint_files$files_removed, "\n")
  cat("Cleanup completed at:", format(results$timestamp, "%Y-%m-%d %H:%M:%S"), "\n\n")
  
  return(results)
}

#' Clean Up Temporary Files
#' @param max_age_hours Numeric maximum age in hours
#' @return List with cleanup results
cleanup_temp_files <- function(max_age_hours = 24) {
  
  cat("Cleaning up temporary files older than", max_age_hours, "hours...\n")
  
  result <- list(
    files_found = 0,
    files_removed = 0,
    space_freed_mb = 0,
    errors = character(0)
  )
  
  # Define temp file patterns and locations
  temp_locations <- c(
    "tests/data/excel_templates",
    "tests/checkpoints",
    tempdir()
  )
  
  temp_patterns <- c(
    "temp.*\\.xlsx$",
    "test_data.*\\.xlsx$",
    "emergency_results.*\\.rds$",
    ".*_temp_.*",
    "Rtmp.*"
  )
  
  cutoff_time <- Sys.time() - (max_age_hours * 3600)
  
  for (location in temp_locations) {
    if (!dir.exists(location)) next
    
    for (pattern in temp_patterns) {
      temp_files <- list.files(location, pattern = pattern, full.names = TRUE, recursive = TRUE)
      
      for (file_path in temp_files) {
        result$files_found <- result$files_found + 1
        
        tryCatch({
          file_info <- file.info(file_path)
          
          if (file_info$mtime < cutoff_time) {
            file_size_mb <- file_info$size / (1024 * 1024)
            
            unlink(file_path)
            
            result$files_removed <- result$files_removed + 1
            result$space_freed_mb <- result$space_freed_mb + file_size_mb
            
            cat("  Removed:", basename(file_path), "(", round(file_size_mb, 2), "MB)\n")
          }
        }, error = function(e) {
          result$errors <<- c(result$errors, paste("Error removing", file_path, ":", e$message))
        })
      }
    }
  }
  
  result$space_freed_mb <- round(result$space_freed_mb, 2)
  
  if (result$files_removed > 0) {
    cat("Temp file cleanup: removed", result$files_removed, "files, freed", result$space_freed_mb, "MB\n")
  } else {
    cat("No temporary files found for cleanup\n")
  }
  
  return(result)
}

#' Clean Up Old Log Files  
#' @param max_age_days Numeric maximum age in days
#' @return List with cleanup results
cleanup_log_files <- function(max_age_days = 30) {
  
  cat("Cleaning up log files older than", max_age_days, "days...\n")
  
  result <- list(
    files_found = 0,
    files_removed = 0,
    space_freed_mb = 0,
    errors = character(0)
  )
  
  log_dir <- "tests/logs"
  if (!dir.exists(log_dir)) {
    cat("Log directory not found, skipping log cleanup\n")
    return(result)
  }
  
  cutoff_time <- Sys.time() - (max_age_days * 24 * 3600)
  
  # Find rotated/archived log files (keep current active logs)
  log_patterns <- c(
    ".*_\\d{8}_\\d{6}\\.log(\\.gz)?$",  # Rotated logs
    "debug_\\d+\\.log$",               # Debug logs
    "temp_.*\\.log$"                   # Temporary logs
  )
  
  for (pattern in log_patterns) {
    log_files <- list.files(log_dir, pattern = pattern, full.names = TRUE)
    
    for (file_path in log_files) {
      result$files_found <- result$files_found + 1
      
      tryCatch({
        file_info <- file.info(file_path)
        
        if (file_info$mtime < cutoff_time) {
          file_size_mb <- file_info$size / (1024 * 1024)
          
          unlink(file_path)
          
          result$files_removed <- result$files_removed + 1
          result$space_freed_mb <- result$space_freed_mb + file_size_mb
          
          cat("  Removed:", basename(file_path), "(", round(file_size_mb, 2), "MB)\n")
        }
      }, error = function(e) {
        result$errors <<- c(result$errors, paste("Error removing", file_path, ":", e$message))
      })
    }
  }
  
  result$space_freed_mb <- round(result$space_freed_mb, 2)
  
  if (result$files_removed > 0) {
    cat("Log file cleanup: removed", result$files_removed, "files, freed", result$space_freed_mb, "MB\n")
  } else {
    cat("No old log files found for cleanup\n")
  }
  
  return(result)
}

#' Clean Up Old Report Files
#' @param max_age_days Numeric maximum age in days
#' @return List with cleanup results  
cleanup_report_files <- function(max_age_days = 90) {
  
  cat("Cleaning up report files older than", max_age_days, "days...\n")
  
  result <- list(
    files_found = 0,
    files_removed = 0,
    files_archived = 0,
    space_freed_mb = 0,
    errors = character(0)
  )
  
  # Check report directories
  report_locations <- c(
    "tests/reports/current",
    "tests/reports/history"
  )
  
  cutoff_time <- Sys.time() - (max_age_days * 24 * 3600)
  archive_enabled <- get_config("reporting.archive.enabled", TRUE)
  
  for (location in report_locations) {
    if (!dir.exists(location)) next
    
    # Find report files
    report_files <- list.files(location, pattern = "test_report_.*\\.(html|txt|csv)$", full.names = TRUE)
    
    for (file_path in report_files) {
      result$files_found <- result$files_found + 1
      
      tryCatch({
        file_info <- file.info(file_path)
        
        if (file_info$mtime < cutoff_time) {
          file_size_mb <- file_info$size / (1024 * 1024)
          
          if (archive_enabled && location == "tests/reports/current") {
            # Archive instead of delete
            archived <- archive_report_file(file_path)
            if (archived) {
              result$files_archived <- result$files_archived + 1
              cat("  Archived:", basename(file_path), "\n")
            } else {
              # Fallback to deletion
              unlink(file_path)
              result$files_removed <- result$files_removed + 1
              result$space_freed_mb <- result$space_freed_mb + file_size_mb
              cat("  Removed:", basename(file_path), "(archival failed)\n")
            }
          } else {
            # Delete old files
            unlink(file_path)
            result$files_removed <- result$files_removed + 1 
            result$space_freed_mb <- result$space_freed_mb + file_size_mb
            cat("  Removed:", basename(file_path), "(", round(file_size_mb, 2), "MB)\n")
          }
        }
      }, error = function(e) {
        result$errors <<- c(result$errors, paste("Error processing", file_path, ":", e$message))
      })
    }
  }
  
  result$space_freed_mb <- round(result$space_freed_mb, 2)
  
  if (result$files_removed > 0 || result$files_archived > 0) {
    cat("Report file cleanup: removed", result$files_removed, "files, archived", result$files_archived, 
        "files, freed", result$space_freed_mb, "MB\n")
  } else {
    cat("No old report files found for cleanup\n")
  }
  
  return(result)
}

#' Clean Up Old Checkpoint Files
#' @param max_age_days Numeric maximum age in days
#' @return List with cleanup results
cleanup_old_checkpoints <- function(max_age_days = 30) {
  
  cat("Cleaning up checkpoint files older than", max_age_days, "days...\n")
  
  result <- list(
    files_found = 0,
    files_removed = 0, 
    space_freed_mb = 0,
    errors = character(0)
  )
  
  checkpoint_dir <- "tests/checkpoints"
  if (!dir.exists(checkpoint_dir)) {
    cat("Checkpoint directory not found, skipping checkpoint cleanup\n")
    return(result)
  }
  
  cutoff_time <- Sys.time() - (max_age_days * 24 * 3600)
  
  # Patterns for old checkpoint files (but keep current session files)
  old_patterns <- c(
    "emergency_results_.*\\.rds$",
    "backup_.*\\.rds$",
    "temp_checkpoint_.*"
  )
  
  for (pattern in old_patterns) {
    checkpoint_files <- list.files(checkpoint_dir, pattern = pattern, full.names = TRUE)
    
    for (file_path in checkpoint_files) {
      result$files_found <- result$files_found + 1
      
      tryCatch({
        file_info <- file.info(file_path)
        
        if (file_info$mtime < cutoff_time) {
          file_size_mb <- file_info$size / (1024 * 1024)
          
          unlink(file_path)
          
          result$files_removed <- result$files_removed + 1
          result$space_freed_mb <- result$space_freed_mb + file_size_mb
          
          cat("  Removed:", basename(file_path), "(", round(file_size_mb, 2), "MB)\n")
        }
      }, error = function(e) {
        result$errors <<- c(result$errors, paste("Error removing", file_path, ":", e$message))
      })
    }
  }
  
  result$space_freed_mb <- round(result$space_freed_mb, 2)
  
  if (result$files_removed > 0) {
    cat("Checkpoint cleanup: removed", result$files_removed, "files, freed", result$space_freed_mb, "MB\n")
  } else {
    cat("No old checkpoint files found for cleanup\n")
  }
  
  return(result)
}

#' Archive Report File
#' @param file_path Character string path to report file
#' @return Logical indicating success
archive_report_file <- function(file_path) {
  
  # Create timestamped archive directory
  timestamp <- format(Sys.time(), "%Y%m%d")
  archive_dir <- file.path("tests", "reports", "history", timestamp)
  
  if (!dir.exists(archive_dir)) {
    dir.create(archive_dir, recursive = TRUE)
  }
  
  tryCatch({
    # Move file to archive
    archive_path <- file.path(archive_dir, basename(file_path))
    file.rename(file_path, archive_path)
    
    # Compress if enabled
    compress_enabled <- get_config("reporting.archive.compress_old_reports", TRUE)
    if (compress_enabled && tools::file_ext(archive_path) != "gz") {
      system(paste("gzip", shQuote(archive_path)))
    }
    
    return(TRUE)
    
  }, error = function(e) {
    warning("Failed to archive file ", file_path, ": ", e$message)
    return(FALSE)
  })
}

#' Get Directory Size
#' @param directory Character string directory path  
#' @return Numeric size in MB
get_directory_size <- function(directory) {
  
  if (!dir.exists(directory)) {
    return(0)
  }
  
  tryCatch({
    files <- list.files(directory, recursive = TRUE, full.names = TRUE)
    total_size <- sum(file.size(files), na.rm = TRUE)
    return(total_size / (1024 * 1024))
  }, error = function(e) {
    warning("Error calculating directory size for ", directory, ": ", e$message)
    return(0)
  })
}

#' Check Disk Space Usage
#' @return List with disk space information
check_disk_space <- function() {
  
  cat("Checking disk space usage...\n")
  
  directories <- list(
    "tests/logs" = get_directory_size("tests/logs"),
    "tests/reports" = get_directory_size("tests/reports"),
    "tests/checkpoints" = get_directory_size("tests/checkpoints"),
    "tests/data" = get_directory_size("tests/data")
  )
  
  total_size <- sum(unlist(directories))
  
  usage_info <- list(
    directories = directories,
    total_mb = round(total_size, 2),
    timestamp = Sys.time()
  )
  
  cat("Disk usage by directory:\n")
  for (dir_name in names(directories)) {
    cat("  ", dir_name, ":", round(directories[[dir_name]], 2), "MB\n")
  }
  cat("Total test directory usage:", round(total_size, 2), "MB\n\n")
  
  return(usage_info)
}

#' Automated Cleanup with Configuration
#' @param dry_run Logical whether to simulate cleanup without actually removing files
#' @return List with cleanup results
automated_cleanup <- function(dry_run = FALSE) {
  
  cat("=== Automated Test Cleanup ===\n")
  if (dry_run) cat("(DRY RUN - no files will be deleted)\n")
  cat("\n")
  
  # Check if auto cleanup is enabled
  auto_cleanup <- get_config("file_management.cleanup.auto_cleanup", TRUE)
  if (!auto_cleanup) {
    cat("Automated cleanup is disabled in configuration.\n")
    return(list(status = "disabled"))
  }
  
  # Get disk usage before cleanup
  usage_before <- check_disk_space()
  
  if (dry_run) {
    cat("DRY RUN: Would clean files based on configuration settings:\n")
    cat("  Temp files older than", get_config("file_management.cleanup.temp_files_max_age_hours", 24), "hours\n")
    cat("  Log files older than", get_config("file_management.cleanup.log_files_max_age_days", 30), "days\n") 
    cat("  Report files older than", get_config("file_management.cleanup.report_files_max_age_days", 90), "days\n")
    return(list(status = "dry_run"))
  }
  
  # Perform actual cleanup
  cleanup_results <- cleanup_test_files()
  
  # Get disk usage after cleanup  
  usage_after <- check_disk_space()
  
  # Calculate space saved
  space_saved <- usage_before$total_mb - usage_after$total_mb
  
  final_results <- list(
    status = "completed",
    cleanup_results = cleanup_results,
    disk_usage = list(
      before_mb = usage_before$total_mb,
      after_mb = usage_after$total_mb,
      space_saved_mb = round(space_saved, 2)
    ),
    timestamp = Sys.time()
  )
  
  cat("Automated cleanup completed. Space saved:", round(space_saved, 2), "MB\n\n")
  
  return(final_results)
}

#' Schedule Cleanup (placeholder for future implementation)
#' @param schedule_type Character string ("daily", "weekly", "monthly")
schedule_cleanup <- function(schedule_type = "daily") {
  cat("Scheduled cleanup (", schedule_type, ") - Feature not yet implemented\n")
  cat("For now, run automated_cleanup() manually or add it to your R startup script\n")
}

# Export main functions
if (interactive()) {
  cat("Cleanup Manager loaded. Available functions:\n")
  cat("  cleanup_test_files()     - Clean up all old test files\n") 
  cat("  automated_cleanup()      - Run automated cleanup based on config\n")
  cat("  check_disk_space()       - Check current disk usage\n")
  cat("  automated_cleanup(TRUE)  - Dry run to see what would be cleaned\n\n")
}