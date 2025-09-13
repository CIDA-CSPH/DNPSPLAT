# Configuration Manager for DNPSPLAT Testing Suite
# Handles loading and managing configuration from YAML files

library(yaml)

# Global configuration storage
TEST_CONFIG <- list()

#' Load Configuration from YAML File
#' @param config_file Character string path to YAML configuration file
#' @return List with configuration settings
load_test_config <- function(config_file = "tests/config/test_config.yml") {
  
  if (!file.exists(config_file)) {
    warning("Configuration file not found: ", config_file)
    return(get_default_config())
  }
  
  tryCatch({
    config <- yaml::read_yaml(config_file)
    
    # Validate and process configuration
    config <- process_config_paths(config)
    config <- validate_config(config)
    
    # Store in global variable
    TEST_CONFIG <<- config
    
    cat("Configuration loaded from:", config_file, "\n")
    cat("Test suite:", config$test_suite$name, "v", config$test_suite$version, "\n")
    cat("Logging level:", config$logging$level, "\n\n")
    
    return(config)
    
  }, error = function(e) {
    warning("Failed to load configuration file: ", e$message)
    cat("Using default configuration instead.\n")
    return(get_default_config())
  })
}

#' Get Default Configuration
#' @return List with default configuration settings
get_default_config <- function() {
  
  default_config <- list(
    test_suite = list(
      name = "DNPSPLAT_Testing_Suite",
      version = "1.0.0",
      default_timeout_seconds = 300,
      retry_failed_tests = TRUE,
      max_retries = 2,
      parallel_execution = FALSE
    ),
    
    logging = list(
      level = "INFO",
      console_output = TRUE,
      file_output = TRUE,
      max_log_size_mb = 50,
      max_log_files = 10,
      log_rotation = TRUE,
      timestamp_format = "%Y-%m-%d %H:%M:%S",
      files = list(
        session = "logs/test_sessions.log",
        module = "logs/module_details.log",
        error = "logs/errors.log",
        performance = "logs/performance.log"
      )
    ),
    
    session = list(
      auto_save_state = TRUE,
      save_interval_minutes = 5,
      enable_crash_recovery = TRUE,
      max_session_history = 50,
      cleanup_old_sessions_days = 30,
      checkpoints = list(
        directory = "checkpoints",
        session_state = "session_state.rds",
        module_progress = "module_progress.json", 
        recovery_data = "recovery_data.rds"
      )
    ),
    
    modules = list(
      default_test_list = c("ciForMean", "ciForProportion", "twoSampleTTest", 
                           "pairedTTest2", "contTable2", "mcnemars", "runChart2",
                           "ttestPower", "wilcoxon1", "wilcoxon2", "descrStats"),
      test_mappings = get_default_test_mappings()
    ),
    
    data = list(
      toy_datasets_file = "data/toy_datasets.R",
      excel_templates_dir = "data/excel_templates",
      custom_datasets_dir = "data/custom_datasets",
      validation = list(
        check_missing_values = TRUE,
        check_data_types = TRUE,
        check_outliers = TRUE,
        outlier_threshold_sd = 3
      ),
      excel = list(
        max_file_size_mb = 10,
        allowed_extensions = c(".xlsx", ".xls"),
        temp_file_cleanup = TRUE
      )
    ),
    
    statistics = list(
      validation = list(
        enabled = TRUE,
        tolerance = 0.01,
        strict_mode = FALSE
      ),
      performance = list(
        max_calculation_time_seconds = 30,
        max_memory_usage_mb = 500,
        track_performance = TRUE
      ),
      error_handling = list(
        continue_on_module_failure = TRUE,
        detailed_error_logging = TRUE,
        save_partial_results = TRUE
      )
    ),
    
    reporting = list(
      output = list(
        current_dir = "reports/current",
        history_dir = "reports/history",
        templates_dir = "reports/templates"
      ),
      generate = list(
        html = TRUE,
        text = TRUE,
        csv = TRUE,
        json = FALSE
      ),
      content = list(
        include_raw_data = FALSE,
        include_plots = TRUE,
        include_performance_metrics = TRUE,
        include_error_details = TRUE,
        max_error_details = 100
      ),
      archive = list(
        enabled = TRUE,
        retention_days = 90,
        compress_old_reports = TRUE
      )
    ),
    
    environment = list(
      local = list(
        r_executable = "C:/Program Files/R/R-4.4.3/bin/R.exe",
        rscript_executable = "C:/Program Files/R/R-4.4.3/bin/Rscript.exe",
        working_directory = "",
        temp_directory = ""
      ),
      production = list(
        shinyapps_url = "",
        timeout_seconds = 600,
        memory_limit_mb = 1024,
        compare_with_local = TRUE
      )
    ),
    
    file_management = list(
      cleanup = list(
        auto_cleanup = TRUE,
        temp_files_max_age_hours = 24,
        log_files_max_age_days = 30,
        report_files_max_age_days = 90
      ),
      backup = list(
        enabled = TRUE,
        backup_before_cleanup = TRUE,
        backup_location = "backups",
        max_backups = 10
      )
    ),
    
    advanced = list(
      memory = list(
        gc_after_module = TRUE,
        memory_monitoring = TRUE,
        memory_limit_warning_mb = 1000
      ),
      debug = list(
        verbose_output = FALSE,
        save_debug_info = FALSE,
        debug_log_file = "logs/debug.log"
      ),
      experimental = list(
        parallel_module_testing = FALSE,
        incremental_reporting = FALSE,
        real_time_monitoring = FALSE
      )
    )
  )
  
  TEST_CONFIG <<- default_config
  return(default_config)
}

#' Get Default Test Mappings
#' @return List with default module to test type mappings
get_default_test_mappings <- function() {
  list(
    ciForMean = c("one_sample_ttest", "two_sample_ttest"),
    ciForProportion = "ci_proportion",
    twoSampleTTest = "two_sample_ttest",
    pairedTTest2 = "paired_ttest", 
    contTable2 = c("contingency_2x2", "contingency_larger"),
    mcnemars = "mcnemars",
    runChart2 = "run_chart",
    ttestPower = "power_analysis",
    wilcoxon1 = "wilcoxon_paired",
    wilcoxon2 = "wilcoxon_two_sample",
    descrStats = "descriptive_stats"
  )
}

#' Process Configuration Paths
#' Make paths relative to tests directory
#' @param config List with raw configuration
#' @return List with processed configuration
process_config_paths <- function(config) {
  
  base_path <- "tests"
  
  # Process logging file paths
  if (!is.null(config$logging$files)) {
    for (file_type in names(config$logging$files)) {
      if (!startsWith(config$logging$files[[file_type]], "/")) {
        config$logging$files[[file_type]] <- file.path(base_path, config$logging$files[[file_type]])
      }
    }
  }
  
  # Process session checkpoint paths
  if (!is.null(config$session$checkpoints$directory)) {
    if (!startsWith(config$session$checkpoints$directory, "/")) {
      config$session$checkpoints$directory <- file.path(base_path, config$session$checkpoints$directory)
    }
  }
  
  # Process data paths
  if (!is.null(config$data)) {
    if (!is.null(config$data$toy_datasets_file) && !startsWith(config$data$toy_datasets_file, "/")) {
      config$data$toy_datasets_file <- file.path(base_path, config$data$toy_datasets_file)
    }
    if (!is.null(config$data$excel_templates_dir) && !startsWith(config$data$excel_templates_dir, "/")) {
      config$data$excel_templates_dir <- file.path(base_path, config$data$excel_templates_dir)
    }
    if (!is.null(config$data$custom_datasets_dir) && !startsWith(config$data$custom_datasets_dir, "/")) {
      config$data$custom_datasets_dir <- file.path(base_path, config$data$custom_datasets_dir)
    }
  }
  
  # Process reporting paths  
  if (!is.null(config$reporting$output)) {
    for (output_type in names(config$reporting$output)) {
      if (!startsWith(config$reporting$output[[output_type]], "/")) {
        config$reporting$output[[output_type]] <- file.path(base_path, config$reporting$output[[output_type]])
      }
    }
  }
  
  return(config)
}

#' Validate Configuration
#' @param config List with configuration to validate
#' @return List with validated configuration
validate_config <- function(config) {
  
  warnings <- character(0)
  
  # Validate required sections
  required_sections <- c("test_suite", "logging", "session", "modules")
  
  for (section in required_sections) {
    if (is.null(config[[section]])) {
      warnings <- c(warnings, paste("Missing required configuration section:", section))
    }
  }
  
  # Validate logging level
  valid_levels <- c("DEBUG", "INFO", "WARN", "ERROR")
  if (!is.null(config$logging$level) && !config$logging$level %in% valid_levels) {
    warnings <- c(warnings, paste("Invalid logging level:", config$logging$level, "- using INFO"))
    config$logging$level <- "INFO"
  }
  
  # Validate numeric ranges
  if (!is.null(config$logging$max_log_size_mb)) {
    if (config$logging$max_log_size_mb < 1 || config$logging$max_log_size_mb > 1000) {
      warnings <- c(warnings, "max_log_size_mb should be between 1 and 1000")
    }
  }
  
  if (!is.null(config$session$max_session_history)) {
    if (config$session$max_session_history < 1) {
      warnings <- c(warnings, "max_session_history should be at least 1")
      config$session$max_session_history <- 10
    }
  }
  
  # Validate module test mappings
  if (!is.null(config$modules$test_mappings)) {
    for (module in names(config$modules$test_mappings)) {
      test_types <- config$modules$test_mappings[[module]]
      if (length(test_types) == 0) {
        warnings <- c(warnings, paste("Module", module, "has no test types defined"))
      }
    }
  }
  
  # Print warnings if any
  if (length(warnings) > 0) {
    cat("Configuration validation warnings:\n")
    for (warning in warnings) {
      cat("  -", warning, "\n")
    }
    cat("\n")
  }
  
  return(config)
}

#' Get Configuration Value
#' @param key_path Character string with dot-separated path (e.g., "logging.level")
#' @param default_value Default value if key not found
#' @return Configuration value or default
get_config <- function(key_path, default_value = NULL) {
  
  if (length(TEST_CONFIG) == 0) {
    load_test_config()
  }
  
  # Split key path
  keys <- strsplit(key_path, "\\.")[[1]]
  
  # Navigate through nested list
  current <- TEST_CONFIG
  for (key in keys) {
    if (is.null(current[[key]])) {
      return(default_value)
    }
    current <- current[[key]]
  }
  
  return(current)
}

#' Set Configuration Value
#' @param key_path Character string with dot-separated path
#' @param value New value to set
set_config <- function(key_path, value) {
  
  if (length(TEST_CONFIG) == 0) {
    load_test_config()
  }
  
  # Split key path
  keys <- strsplit(key_path, "\\.")[[1]]
  
  # Navigate and set value
  current <- TEST_CONFIG
  for (i in 1:(length(keys) - 1)) {
    if (is.null(current[[keys[i]]])) {
      current[[keys[i]]] <- list()
    }
    current <- current[[keys[i]]]
  }
  
  current[[keys[length(keys)]]] <- value
  
  # Update global configuration
  TEST_CONFIG <<- TEST_CONFIG
}

#' Save Configuration to File
#' @param config_file Character string path to save configuration
#' @param config Optional configuration list (uses global if NULL)
save_test_config <- function(config_file = "tests/config/test_config.yml", config = NULL) {
  
  if (is.null(config)) {
    config <- TEST_CONFIG
  }
  
  if (length(config) == 0) {
    warning("No configuration to save")
    return(FALSE)
  }
  
  tryCatch({
    yaml::write_yaml(config, config_file)
    cat("Configuration saved to:", config_file, "\n")
    return(TRUE)
  }, error = function(e) {
    warning("Failed to save configuration:", e$message)
    return(FALSE)
  })
}

#' Get Module Test Types
#' @param module_name Character string name of module
#' @return Character vector of test types for the module
get_module_test_types <- function(module_name) {
  
  test_mappings <- get_config("modules.test_mappings", get_default_test_mappings())
  
  if (module_name %in% names(test_mappings)) {
    return(test_mappings[[module_name]])
  } else {
    warning("No test types defined for module:", module_name)
    return(character(0))
  }
}

#' Get All Configured Modules
#' @return Character vector of all configured module names
get_all_modules <- function() {
  
  default_list <- get_config("modules.default_test_list", character(0))
  
  if (length(default_list) > 0) {
    return(default_list)
  }
  
  # Fallback to modules with test mappings
  test_mappings <- get_config("modules.test_mappings", list())
  return(names(test_mappings))
}

#' Print Configuration Summary
print_config_summary <- function() {
  
  if (length(TEST_CONFIG) == 0) {
    cat("No configuration loaded. Use load_test_config() first.\n")
    return()
  }
  
  cat("=== DNPSPLAT Test Configuration Summary ===\n\n")
  
  cat("Test Suite:", get_config("test_suite.name", "Unknown"), 
      "v", get_config("test_suite.version", "Unknown"), "\n")
  cat("Logging Level:", get_config("logging.level", "INFO"), "\n")
  cat("Crash Recovery:", ifelse(get_config("session.enable_crash_recovery", FALSE), "Enabled", "Disabled"), "\n")
  
  modules <- get_all_modules()
  cat("Modules to Test (", length(modules), "):", paste(modules, collapse = ", "), "\n")
  
  cat("Report Generation:")
  if (get_config("reporting.generate.html", FALSE)) cat(" HTML")
  if (get_config("reporting.generate.text", FALSE)) cat(" Text") 
  if (get_config("reporting.generate.csv", FALSE)) cat(" CSV")
  if (get_config("reporting.generate.json", FALSE)) cat(" JSON")
  cat("\n")
  
  cat("Auto Cleanup:", ifelse(get_config("file_management.cleanup.auto_cleanup", FALSE), "Enabled", "Disabled"), "\n")
  
  cat("\n=== End Configuration Summary ===\n\n")
}

# Load configuration when file is sourced
if (file.exists("tests/config/test_config.yml")) {
  load_test_config()
} else {
  get_default_config()
}