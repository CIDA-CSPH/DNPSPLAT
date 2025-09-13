# Automated Testing Suite for DNPSPLAT Shiny Application
# This script provides systematic testing of all statistical modules

# Load required libraries
library(shiny)
library(testthat)

# Source the toy datasets and expected results with path checking
if (file.exists("tests/data/toy_datasets.R")) {
  source("tests/data/toy_datasets.R")
} else if (file.exists("tests/toy_datasets.R")) {
  source("tests/toy_datasets.R")
} else {
  stop("Cannot find toy_datasets.R in expected locations")
}

if (file.exists("tests/core/expected_results.R")) {
  source("tests/core/expected_results.R") 
} else if (file.exists("tests/expected_results.R")) {
  source("tests/expected_results.R")
} else {
  stop("Cannot find expected_results.R in expected locations")
}

#' Test Module Data Input Methods
#' @param module_name Character string of the module to test
#' @param test_type Character string of the data type to use
#' @return List with test results for each input method
test_module_data_input <- function(module_name, test_type) {
  
  results <- list(
    module = module_name,
    test_type = test_type,
    timestamp = Sys.time(),
    matrix_input = NULL,
    paste_input = NULL,
    file_upload = NULL,
    errors = character(0)
  )
  
  # Test 1: Matrix Input
  tryCatch({
    matrix_data <- get_matrix_data(test_type)
    results$matrix_input <- list(
      status = "success",
      data_points = nrow(matrix_data),
      data_preview = head(matrix_data[,1], 5)
    )
  }, error = function(e) {
    results$matrix_input <- list(status = "error", message = e$message)
    results$errors <- c(results$errors, paste("Matrix input:", e$message))
  })
  
  # Test 2: Paste Input  
  tryCatch({
    paste_data <- get_paste_data(test_type)
    parsed_values <- as.numeric(strsplit(paste_data, "\n")[[1]])
    results$paste_input <- list(
      status = "success", 
      data_points = length(parsed_values),
      data_preview = head(parsed_values, 5)
    )
  }, error = function(e) {
    results$paste_input <- list(status = "error", message = e$message)
    results$errors <- c(results$errors, paste("Paste input:", e$message))
  })
  
  # Test 3: File Upload (create temporary Excel file)
  tryCatch({
    temp_file <- tempfile(fileext = ".xlsx")
    create_excel_test_file(test_type, temp_file)
    
    if (file.exists(temp_file)) {
      file_size <- file.size(temp_file)
      results$file_upload <- list(
        status = "success",
        file_path = temp_file,
        file_size = file_size
      )
    } else {
      results$file_upload <- list(status = "error", message = "File creation failed")
    }
    
    # Clean up
    unlink(temp_file)
    
  }, error = function(e) {
    results$file_upload <- list(status = "error", message = e$message)
    results$errors <- c(results$errors, paste("File upload:", e$message))
  })
  
  return(results)
}

#' Test Statistical Calculations
#' @param test_type Character string of the data type to use
#' @param expected_results Expected results from reference database
#' @return List with calculation test results
test_statistical_calculations <- function(test_type, expected_results = NULL) {
  
  results <- list(
    test_type = test_type,
    timestamp = Sys.time(),
    calculation_results = NULL,
    validation = NULL,
    errors = character(0)
  )
  
  data_list <- get_test_data(test_type)
  
  tryCatch({
    # Perform appropriate statistical test based on type
    if (test_type == "one_sample_ttest") {
      test_result <- t.test(data_list$data, mu = data_list$test_value)
      results$calculation_results <- list(
        t_statistic = test_result$statistic,
        p_value = test_result$p.value,
        df = test_result$parameter,
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean = test_result$estimate
      )
      
    } else if (test_type == "two_sample_ttest") {
      test_result <- t.test(data_list$group1, data_list$group2)
      results$calculation_results <- list(
        t_statistic = test_result$statistic,
        p_value = test_result$p.value,
        df = test_result$parameter,
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean_diff = diff(test_result$estimate)
      )
      
    } else if (test_type == "paired_ttest") {
      test_result <- t.test(data_list$before, data_list$after, paired = TRUE)
      results$calculation_results <- list(
        t_statistic = test_result$statistic,
        p_value = test_result$p.value,
        df = test_result$parameter,
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean_diff = test_result$estimate
      )
      
    } else if (test_type == "ci_proportion") {
      test_result <- prop.test(data_list$successes, data_list$total)
      results$calculation_results <- list(
        proportion = test_result$estimate,
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        x_squared = test_result$statistic,
        p_value = test_result$p.value
      )
      
    } else if (test_type %in% c("contingency_2x2", "contingency_larger")) {
      test_result <- chisq.test(data_list$data)
      results$calculation_results <- list(
        chi_squared = test_result$statistic,
        p_value = test_result$p.value,
        df = test_result$parameter,
        expected_freq = test_result$expected
      )
      
    } else if (test_type == "mcnemars") {
      test_result <- mcnemar.test(data_list$data)
      results$calculation_results <- list(
        chi_squared = test_result$statistic,
        p_value = test_result$p.value,
        df = test_result$parameter
      )
      
    } else if (test_type == "wilcoxon_paired") {
      test_result <- wilcox.test(data_list$before, data_list$after, paired = TRUE)
      results$calculation_results <- list(
        V_statistic = test_result$statistic,
        p_value = test_result$p.value
      )
      
    } else if (test_type == "wilcoxon_two_sample") {
      test_result <- wilcox.test(data_list$group1, data_list$group2)
      results$calculation_results <- list(
        W_statistic = test_result$statistic,
        p_value = test_result$p.value
      )
      
    } else if (test_type == "descriptive_stats") {
      results$calculation_results <- list(
        mean = mean(data_list$data, na.rm = TRUE),
        median = median(data_list$data, na.rm = TRUE),
        sd = sd(data_list$data, na.rm = TRUE),
        min = min(data_list$data, na.rm = TRUE),
        max = max(data_list$data, na.rm = TRUE),
        n = length(data_list$data[!is.na(data_list$data)])
      )
    }
    
    # Validate against expected results if provided
    if (!is.null(expected_results) && !is.null(results$calculation_results)) {
      results$validation <- validate_results(results$calculation_results, expected_results)
    }
    
  }, error = function(e) {
    results$errors <- c(results$errors, paste("Calculation error:", e$message))
  })
  
  return(results)
}

#' Validate Results Against Expected Values
#' @param actual_results Actual calculation results
#' @param expected_results Expected results
#' @param tolerance Numeric tolerance for comparisons
#' @return List with validation results
validate_results <- function(actual_results, expected_results, tolerance = 0.01) {
  
  validation <- list(
    overall_status = "pass",
    individual_checks = list(),
    mismatches = character(0)
  )
  
  for (param in names(expected_results)) {
    if (param %in% names(actual_results)) {
      actual_val <- actual_results[[param]]
      expected_val <- expected_results[[param]]
      
      # Check if values are within tolerance
      if (is.numeric(actual_val) && is.numeric(expected_val)) {
        within_tolerance <- abs(actual_val - expected_val) <= tolerance
        validation$individual_checks[[param]] <- list(
          actual = actual_val,
          expected = expected_val,
          within_tolerance = within_tolerance
        )
        
        if (!within_tolerance) {
          validation$overall_status <- "fail"
          validation$mismatches <- c(validation$mismatches, 
                                   paste(param, "- Actual:", round(actual_val, 4), 
                                        "Expected:", round(expected_val, 4)))
        }
      }
    } else {
      validation$mismatches <- c(validation$mismatches, 
                               paste("Missing parameter:", param))
      validation$overall_status <- "fail"
    }
  }
  
  return(validation)
}

#' Run Complete Test Suite for All Modules
#' @param modules Vector of module names to test (if NULL, tests all)
#' @return List with complete test results
run_complete_test_suite <- function(modules = NULL) {
  
  # Define all available modules and their appropriate test types
  module_test_mapping <- list(
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
  
  if (is.null(modules)) {
    modules <- names(module_test_mapping)
  }
  
  test_results <- list(
    timestamp = Sys.time(),
    summary = list(
      total_modules = length(modules),
      total_tests = 0,
      passed_tests = 0,
      failed_tests = 0
    ),
    module_results = list(),
    overall_status = "unknown"
  )
  
  cat("Starting comprehensive test suite...\n")
  cat("Testing", length(modules), "modules\n\n")
  
  for (module in modules) {
    cat("Testing module:", module, "\n")
    
    test_types <- module_test_mapping[[module]]
    if (is.null(test_types)) {
      cat("  Warning: No test types defined for module", module, "\n")
      next
    }
    
    module_results <- list()
    
    for (test_type in test_types) {
      cat("  Testing with data type:", test_type, "\n")
      
      # Test data input methods
      input_results <- test_module_data_input(module, test_type)
      
      # Test statistical calculations
      expected_results <- get_expected_results(test_type)
      calc_results <- test_statistical_calculations(test_type, expected_results)
      
      module_results[[test_type]] <- list(
        input_tests = input_results,
        calculation_tests = calc_results
      )
      
      test_results$summary$total_tests <- test_results$summary$total_tests + 1
      
      # Check if test passed
      input_passed <- length(input_results$errors) == 0
      calc_passed <- length(calc_results$errors) == 0
      
      if (input_passed && calc_passed) {
        test_results$summary$passed_tests <- test_results$summary$passed_tests + 1
        cat("    PASSED\n")
      } else {
        test_results$summary$failed_tests <- test_results$summary$failed_tests + 1
        cat("    FAILED\n")
        if (length(input_results$errors) > 0) {
          cat("      Input errors:", paste(input_results$errors, collapse = "; "), "\n")
        }
        if (length(calc_results$errors) > 0) {
          cat("      Calculation errors:", paste(calc_results$errors, collapse = "; "), "\n")
        }
      }
    }
    
    test_results$module_results[[module]] <- module_results
    cat("\n")
  }
  
  # Overall status
  if (test_results$summary$failed_tests == 0) {
    test_results$overall_status <- "all_passed"
  } else if (test_results$summary$passed_tests > 0) {
    test_results$overall_status <- "partial_failure"
  } else {
    test_results$overall_status <- "all_failed"
  }
  
  cat("Test suite completed!\n")
  cat("Total tests:", test_results$summary$total_tests, "\n")
  cat("Passed:", test_results$summary$passed_tests, "\n") 
  cat("Failed:", test_results$summary$failed_tests, "\n")
  cat("Overall status:", test_results$overall_status, "\n\n")
  
  return(test_results)
}

#' Quick Smoke Test - Basic functionality check
#' @return List with smoke test results
run_smoke_test <- function() {
  cat("Running smoke test - basic functionality check...\n")
  
  smoke_results <- list(
    timestamp = Sys.time(),
    tests = list(),
    overall_status = "unknown"
  )
  
  # Test basic data loading
  test_types <- c("one_sample_ttest", "two_sample_ttest", "paired_ttest")
  
  all_passed <- TRUE
  
  for (test_type in test_types) {
    tryCatch({
      data_list <- get_test_data(test_type)
      smoke_results$tests[[test_type]] <- "passed"
      cat("  ", test_type, "- PASSED\n")
    }, error = function(e) {
      smoke_results$tests[[test_type]] <- paste("failed:", e$message)
      cat("  ", test_type, "- FAILED:", e$message, "\n")
      all_passed <- FALSE
    })
  }
  
  smoke_results$overall_status <- ifelse(all_passed, "passed", "failed")
  
  cat("Smoke test completed:", smoke_results$overall_status, "\n\n")
  return(smoke_results)
}