# McNemar's Test UI Testing - Specific Focus on Reported Issue
# Tests the exact scenario reported: 2x2 table causing "nonnegative and finite" error

# Load required libraries and framework
source("tests/ui/setup-shinytest2.R")
source("tests/data/toy_datasets.R")

#' Test McNemar's Module UI with Problematic Data
#' This tests the exact issue reported in the email
test_mcnemars_ui <- function(headless = TRUE) {
  
  cat("=== Testing McNemar's UI with Problematic Data ===\n")
  
  # Configure for testing
  options(shinytest2.headless = headless)
  
  # Create results directory
  if (!dir.exists("tests/screenshots/mcnemars")) {
    dir.create("tests/screenshots/mcnemars", recursive = TRUE)
  }
  
  tryCatch({
    # Start app
    app <- AppDriver$new(
      app_dir = ".",
      name = "DNPSPLAT_McNemar_Test",
      height = 1000,
      width = 1600
    )
    
    cat("App started, waiting for load...\n")
    app$wait_for_idle(duration = 3000)
    
    # Take initial screenshot
    app$get_screenshot("tests/screenshots/mcnemars/01_app_loaded.png")
    
    # Navigate to McNemar's test
    cat("Navigating to McNemar's module...\n")
    navigation_success <- navigate_to_mcnemars(app)
    
    if (!navigation_success) {
      cat("ERROR: Could not navigate to McNemar's module\n")
      app$stop()
      return(list(status = "NAVIGATION_FAILED"))
    }
    
    # Take screenshot after navigation
    app$get_screenshot("tests/screenshots/mcnemars/02_mcnemars_loaded.png")
    
    # Test different data input methods with the problematic data
    results <- list()
    
    # Test 1: Manual Entry (Enter Data by Hand tab)
    results$manual_entry <- test_mcnemars_manual_entry(app)
    
    # Test 2: Paste Data tab
    results$paste_data <- test_mcnemars_paste_data(app)
    
    # Test 3: Example Data tab (baseline)
    results$example_data <- test_mcnemars_example_data(app)
    
    app$stop()
    
    # Generate summary
    summary <- generate_mcnemars_test_summary(results)
    
    return(list(
      status = "COMPLETED",
      results = results,
      summary = summary
    ))
    
  }, error = function(e) {
    cat("CRITICAL ERROR in McNemar's UI testing:", e$message, "\n")
    return(list(
      status = "CRITICAL_ERROR",
      error = e$message
    ))
  })
}

#' Navigate to McNemar's Module
#' @param app AppDriver instance
#' @return Boolean success
navigate_to_mcnemars <- function(app) {
  
  # Try multiple navigation methods
  navigation_methods <- list(
    # Method 1: Direct tab click
    function() {
      app$click("a[data-value='mcnemars']")
      app$wait_for_idle()
    },
    
    # Method 2: Menu navigation
    function() {
      # First click Analyze menu
      app$click("a[data-value='analyze']")
      app$wait_for_idle(1000)
      # Then click McNemar's
      app$click("a[data-value='mcnemars']")  
      app$wait_for_idle()
    },
    
    # Method 3: Text-based navigation
    function() {
      app$click(selector = "a", text = "McNemar")
      app$wait_for_idle()
    }
  )
  
  for (i in seq_along(navigation_methods)) {
    tryCatch({
      cat("Trying navigation method", i, "...\n")
      navigation_methods[[i]]()
      
      # Check if we're on McNemar's page
      page_title <- app$get_js("document.title")
      mcnemars_elements <- app$get_js("$('[id*=\"mcnemars\"]').length")
      
      if (mcnemars_elements > 0) {
        cat("Successfully navigated to McNemar's module\n")
        return(TRUE)
      }
      
    }, error = function(e) {
      cat("Navigation method", i, "failed:", e$message, "\n")
    })
  }
  
  return(FALSE)
}

#' Test Manual Entry with Problematic Data
#' @param app AppDriver instance
#' @return Test results
test_mcnemars_manual_entry <- function(app) {
  
  cat("Testing manual entry with problematic data...\n")
  
  result <- list(
    method = "manual_entry",
    status = "UNKNOWN",
    errors = character(0),
    data_entered = FALSE,
    calculation_attempted = FALSE
  )
  
  tryCatch({
    # Click on "Enter Data by Hand" tab
    app$click("a[href='#shiny-tab-4']")
    app$wait_for_idle(1000)
    
    app$get_screenshot("tests/screenshots/mcnemars/03_manual_entry_tab.png")
    
    # The problematic data from the email:
    # Pre-intervention: Adherence=3, No Adherence=21  
    # Post-intervention: Adherence=22, No Adherence=2
    
    # For McNemar's test, this should be entered as a 2x2 matrix where:
    # Rows = Pre-intervention status
    # Cols = Post-intervention status
    
    problematic_data <- matrix(
      c(3, 22, 21, 2), # (Pre-Adh,Post-Adh), (Pre-Adh,Post-NoAdh), (Pre-NoAdh,Post-Adh), (Pre-NoAdh,Post-NoAdh)
      nrow = 2,
      byrow = TRUE,
      dimnames = list(
        c("Pre: Adherence", "Pre: No Adherence"),
        c("Post: Adherence", "Post: No Adherence")
      )
    )
    
    # Try to input the matrix data
    # Note: This is tricky as matrixInput may have specific input methods
    matrix_input_success <- FALSE
    
    # Look for matrix input elements
    matrix_inputs <- app$get_js("
      var inputs = [];
      $('[id*=\"matrix1a4\"] input').each(function(i) {
        inputs.push({index: i, id: this.id, value: this.value});
      });
      inputs;
    ")
    
    if (length(matrix_inputs) >= 4) {
      # Try to fill in the matrix values
      tryCatch({
        # This is a simplified approach - may need adjustment based on actual HTML structure
        values <- c(3, 22, 21, 2)
        
        for (i in 1:4) {
          input_selector <- sprintf("[id*='matrix1a4'] input:nth-child(%d)", i)
          app$set_inputs_js(sprintf("
            $('%s').val(%d).trigger('change');
          ", input_selector, values[i]))
        }
        
        app$wait_for_idle(1000)
        matrix_input_success <- TRUE
        result$data_entered <- TRUE
        
      }, error = function(e) {
        cat("Matrix input failed:", e$message, "\n")
        result$errors <- c(result$errors, paste("Matrix input:", e$message))
      })
    }
    
    app$get_screenshot("tests/screenshots/mcnemars/04_data_entered.png")
    
    # Check for immediate errors after data entry
    immediate_errors <- app$get_js("
      var errors = [];
      $('.shiny-output-error').each(function() {
        if ($(this).text().trim() !== '') {
          errors.push($(this).text().trim());
        }
      });
      errors;
    ")
    
    if (length(immediate_errors) > 0) {
      result$errors <- c(result$errors, immediate_errors)
      result$status <- "ERROR_ON_INPUT"
      
      # Check specifically for the "nonnegative and finite" error
      if (any(grepl("nonnegative and finite", immediate_errors))) {
        result$status <- "NONNEGATIVE_FINITE_ERROR"
        cat("FOUND THE PROBLEMATIC ERROR: 'nonnegative and finite'\n")
      }
    } else {
      result$status <- "INPUT_SUCCESS"
      cat("Data input successful, no immediate errors\n")
    }
    
    app$get_screenshot("tests/screenshots/mcnemars/05_after_input.png")
    
  }, error = function(e) {
    result$status <- "CRITICAL_ERROR"
    result$errors <- c(result$errors, e$message)
    
    app$get_screenshot("tests/screenshots/mcnemars/05_critical_error.png")
  })
  
  return(result)
}

#' Test Paste Data Method
#' @param app AppDriver instance  
#' @return Test results
test_mcnemars_paste_data <- function(app) {
  
  cat("Testing paste data method...\n")
  
  result <- list(
    method = "paste_data",
    status = "UNKNOWN",
    errors = character(0)
  )
  
  tryCatch({
    # Click on "Paste Data" tab
    app$click("a[href='#shiny-tab-2']")
    app$wait_for_idle(1000)
    
    app$get_screenshot("tests/screenshots/mcnemars/06_paste_data_tab.png")
    
    # Test with paste data method
    # This may involve different UI elements
    
    # Check for errors
    errors <- app$get_js("
      $('.shiny-output-error').map(function() { return $(this).text().trim(); }).get();
    ")
    
    result$errors <- errors
    result$status <- if (length(errors) == 0) "PASS" else "ERRORS_FOUND"
    
  }, error = function(e) {
    result$status <- "ERROR"
    result$errors <- c(result$errors, e$message)
  })
  
  return(result)
}

#' Test Example Data (Baseline)
#' @param app AppDriver instance
#' @return Test results
test_mcnemars_example_data <- function(app) {
  
  cat("Testing example data (baseline)...\n")
  
  result <- list(
    method = "example_data",
    status = "UNKNOWN", 
    errors = character(0)
  )
  
  tryCatch({
    # Click on "Example Data" tab
    app$click("a[href='#shiny-tab-1']")  
    app$wait_for_idle(1000)
    
    app$get_screenshot("tests/screenshots/mcnemars/07_example_data.png")
    
    # The example data should work without issues
    # Check for any errors
    errors <- app$get_js("
      $('.shiny-output-error').map(function() { return $(this).text().trim(); }).get();
    ")
    
    result$errors <- errors
    result$status <- if (length(errors) == 0) "PASS" else "UNEXPECTED_ERRORS"
    
    app$get_screenshot("tests/screenshots/mcnemars/08_example_results.png")
    
  }, error = function(e) {
    result$status <- "ERROR"
    result$errors <- c(result$errors, e$message)
  })
  
  return(result)
}

#' Generate Test Summary
#' @param results Test results list
#' @return Summary list
generate_mcnemars_test_summary <- function(results) {
  
  summary <- list(
    total_tests = length(results),
    passed = 0,
    failed = 0,
    errors_found = 0,
    specific_issue_reproduced = FALSE
  )
  
  for (test_name in names(results)) {
    test <- results[[test_name]]
    
    if (test$status == "PASS" || test$status == "INPUT_SUCCESS") {
      summary$passed <- summary$passed + 1
    } else {
      summary$failed <- summary$failed + 1
    }
    
    if (length(test$errors) > 0) {
      summary$errors_found <- summary$errors_found + length(test$errors)
    }
    
    # Check if we reproduced the specific issue
    if (test$status == "NONNEGATIVE_FINITE_ERROR") {
      summary$specific_issue_reproduced <- TRUE
    }
  }
  
  return(summary)
}

# Export the main testing function
cat("McNemar's UI test module loaded.\n")
cat("Run test_mcnemars_ui() to execute the test.\n")