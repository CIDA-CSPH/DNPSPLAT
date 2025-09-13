# shinytest2 Setup and Configuration for DNPSPLAT UI Testing
# Integrates with existing toy dataset framework

cat("=== shinytest2 UI Testing Setup ===\n")

# STEP 1: Configure Chrome first (CRITICAL for Windows)
if (file.exists("tests/ui/chrome_config.R")) {
  cat("Loading Chrome configuration...\n")
  source("tests/ui/chrome_config.R")
  
  if (!exists(".chrome_config_initialized") || !.chrome_config_initialized) {
    cat("⚠️  Chrome configuration failed - UI tests may not work\n")
    cat("Run diagnose_chrome_issues() for troubleshooting\n")
  }
} else {
  cat("⚠️  Chrome configuration file not found\n")
  cat("UI tests may fail without proper Chrome setup\n")
}

# STEP 2: Load required libraries (after Chrome config)
required_packages <- c("shinytest2", "chromote", "testthat")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("Installing", pkg, "...\n")
    install.packages(pkg)
    library(pkg, character.only = TRUE, quietly = TRUE)
  }
}

# STEP 3: Load existing testing framework
source("tests/data/toy_datasets.R")
source("tests/core/test_logger.R")

#' Run UI Tests Using Existing Toy Datasets
#' @param headless Boolean - run in headless mode (default TRUE)
#' @param modules Vector - specific modules to test (default all)
#' @return List of test results
run_ui_tests <- function(headless = TRUE, modules = NULL) {
  
  cat("Starting UI tests with shinytest2...\n")
  
  # CRITICAL: Ensure we bypass CRAN detection
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) {
    Sys.setenv(NOT_CRAN = "true")
    cat("✓ Set NOT_CRAN=true to enable Chrome testing\n")
  }
  
  # Configure shinytest2
  options(
    shinytest2.headless = headless,
    chromote.timeout = 30000
  )
  
  # Create screenshots directory
  if (!dir.exists("tests/screenshots")) {
    dir.create("tests/screenshots", recursive = TRUE)
  }
  
  # Define modules with their corresponding toy dataset types
  if (is.null(modules)) {
    modules <- list(
      "ciForMean" = "one_sample_ttest",
      "ciForProportion" = "ci_proportion", 
      "twoSampleTTest" = "two_sample_ttest",
      "pairedTTest2" = "paired_ttest",
      "contTable2" = "contingency_2x2",
      "mcnemars" = "mcnemars",
      "wilcoxon1" = "wilcoxon_paired",
      "wilcoxon2" = "wilcoxon_two_sample",
      "descrStats" = "descriptive_stats"
    )
  }
  
  # Start Shiny app
  tryCatch({
    app <- AppDriver$new(
      app_dir = ".",
      name = "DNPSPLAT_UI_Test",
      height = 900,
      width = 1400,
      timeout = 60000,  # Longer timeout for authentication
      load_timeout = 60000
    )
    
    # Wait for app to load
    app$wait_for_idle(duration = 3000)
    
    # Authentication removed - app loads directly
    cat("App loads directly without authentication...\n")
    
    # Take screenshot of main page
    app$get_screenshot("tests/screenshots/01_main_page.png")
    
    # Test each module
    ui_results <- list()
    
    for (module_name in names(modules)) {
      test_type <- modules[[module_name]]
      cat(sprintf("Testing UI for module: %s with dataset: %s\n", module_name, test_type))
      
      ui_results[[module_name]] <- test_module_ui(app, module_name, test_type)
      
      # Brief pause between modules
      Sys.sleep(1)
    }
    
    app$stop()
    
    return(ui_results)
    
  }, error = function(e) {
    cat("ERROR in UI testing:", e$message, "\n")
    return(list(error = e$message))
  })
}

#' Test Individual Module UI Using Toy Datasets
#' @param app AppDriver instance
#' @param module_name Name of the module to test
#' @param test_type Type of toy dataset to use
#' @return List with test results
test_module_ui <- function(app, module_name, test_type) {
  
  result <- list(
    module = module_name,
    test_type = test_type,
    timestamp = Sys.time(),
    status = "UNKNOWN",
    errors = character(0),
    tests_completed = list()
  )
  
  tryCatch({
    # Navigate to module using proper nested tab structure
    navigation_success <- FALSE
    
    # Method 1: Navigate through the proper tab hierarchy using text-based clicking
    tryCatch({
      cat("Navigating to", module_name, "via Analyze tab...\n")
      
      # First, click on the "Analyze" top-level tab using visible text
      # Use XPath to find the link by text content
      app$click("//a[contains(text(), 'Analyze')]")
      app$wait_for_idle(duration = 2000)
      app$get_screenshot(sprintf("tests/screenshots/%s_01_analyze_tab.png", module_name))
      
      # Then navigate to the specific sub-module
      if (module_name %in% c("contTable2", "mcnemars")) {
        # These are under "Contingency Table Tests"
        app$click("//a[contains(text(), 'Contingency Table Tests')]")
        app$wait_for_idle(duration = 2000)
        app$get_screenshot(sprintf("tests/screenshots/%s_02_contingency_tab.png", module_name))
        
        if (module_name == "mcnemars") {
          # Look for McNemar's specific elements within the contingency table module
          cat("Looking for McNemar's test within Contingency Table Tests...\n")
        }
        
      } else if (module_name == "twoSampleTTest" || module_name == "pairedTTest2") {
        # These are under "T-Tests" 
        app$click("//a[contains(text(), 'T-Tests')]")
        app$wait_for_idle(duration = 2000)
        
      } else if (module_name == "ciForMean" || module_name == "ciForProportion") {
        # These are under "Confidence Intervals"
        app$click("//a[contains(text(), 'Confidence Intervals')]")
        app$wait_for_idle(duration = 2000)
        
      } else if (module_name == "descrStats") {
        # This is under "Descriptive Statistics"
        app$click("//a[contains(text(), 'Descriptive Statistics')]")
        app$wait_for_idle(duration = 2000)
      }
      
      navigation_success <- TRUE
      
    }, error = function(e) {
      cat("Navigation method 1 failed for", module_name, ":", e$message, "\n")
    })
    
    # Method 2: Try alternative selectors if first method failed  
    if (!navigation_success) {
      tryCatch({
        # Try clicking by visible text
        app$click(sprintf("//a[contains(text(), '%s')]", module_name))
        app$wait_for_idle()
        navigation_success <- TRUE
      }, error = function(e) {
        cat("Navigation method 2 failed for", module_name, ":", e$message, "\n")
      })
    }
    
    if (!navigation_success) {
      result$status <- "NAVIGATION_FAILED"
      result$errors <- c(result$errors, "Could not navigate to module")
      return(result)
    }
    
    # Take screenshot after navigation
    app$get_screenshot(sprintf("tests/screenshots/%s_loaded.png", module_name))
    
    # Test data input methods using existing toy datasets
    result$tests_completed$matrix_input <- test_matrix_input_ui(app, module_name, test_type)
    result$tests_completed$paste_input <- test_paste_input_ui(app, module_name, test_type)
    
    # Check for any Shiny errors
    error_elements <- app$get_js("
      var errors = [];
      $('.shiny-output-error').each(function() {
        if ($(this).text().trim() !== '') {
          errors.push($(this).text().trim());
        }
      });
      errors;
    ")
    
    if (length(error_elements) > 0) {
      result$errors <- c(result$errors, error_elements)
      result$status <- "ERRORS_FOUND"
    } else {
      result$status <- "PASS"
    }
    
    # Take final screenshot
    app$get_screenshot(sprintf("tests/screenshots/%s_final.png", module_name))
    
  }, error = function(e) {
    result$status <- "ERROR"
    result$errors <- c(result$errors, e$message)
    
    # Take error screenshot
    tryCatch({
      app$get_screenshot(sprintf("tests/screenshots/%s_error.png", module_name))
    }, error = function(screenshot_error) {
      cat("Could not take error screenshot:", screenshot_error$message, "\n")
    })
  })
  
  return(result)
}

#' Test Matrix Input UI
#' @param app AppDriver instance
#' @param module_name Module being tested  
#' @param test_type Dataset type
#' @return Test result
test_matrix_input_ui <- function(app, module_name, test_type) {
  
  tryCatch({
    # Get matrix data from existing toy datasets
    matrix_data <- get_matrix_data(test_type)
    
    # Try to find and interact with matrix input
    # This will vary by module, so we'll use a generic approach
    
    # Look for matrixInput elements
    matrix_found <- app$get_js("
      $('[id*=\"matrix\"]').length > 0
    ")
    
    if (matrix_found) {
      # Take screenshot of matrix input
      app$get_screenshot(sprintf("tests/screenshots/%s_matrix_input.png", module_name))
      
      # For now, just verify the input exists
      # More specific input testing will be added per module
      return(list(
        method = "matrix_input",
        status = "INPUT_FOUND",
        data_prepared = !is.null(matrix_data)
      ))
    } else {
      return(list(
        method = "matrix_input", 
        status = "INPUT_NOT_FOUND"
      ))
    }
    
  }, error = function(e) {
    return(list(
      method = "matrix_input",
      status = "ERROR", 
      message = e$message
    ))
  })
}

#' Test Paste Input UI
#' @param app AppDriver instance
#' @param module_name Module being tested
#' @param test_type Dataset type  
#' @return Test result
test_paste_input_ui <- function(app, module_name, test_type) {
  
  tryCatch({
    # Get paste data from existing toy datasets
    paste_data <- get_paste_data(test_type)
    
    # Look for text area inputs
    textarea_found <- app$get_js("
      $('textarea, [id*=\"paste\"], [id*=\"data\"]').length > 0
    ")
    
    if (textarea_found) {
      return(list(
        method = "paste_input",
        status = "INPUT_FOUND",
        data_prepared = !is.null(paste_data)
      ))
    } else {
      return(list(
        method = "paste_input",
        status = "INPUT_NOT_FOUND"
      ))
    }
    
  }, error = function(e) {
    return(list(
      method = "paste_input",
      status = "ERROR",
      message = e$message
    ))
  })
}

cat("shinytest2 setup complete!\n")
cat("Use run_ui_tests() to execute UI testing suite\n")