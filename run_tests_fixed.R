# DNPSPLAT Testing Script - Fixed Version
# This script runs the resilient testing suite with proper error handling

cat("=== DNPSPLAT Testing Suite - Fixed ===\n")
cat("Starting tests at:", format(Sys.time()), "\n\n")

# Load required libraries with error handling
load_package <- function(pkg_name) {
  tryCatch({
    if (!requireNamespace(pkg_name, quietly = TRUE)) {
      cat("WARNING: Package", pkg_name, "not available\n")
      return(FALSE)
    }
    return(TRUE)
  }, error = function(e) {
    cat("ERROR loading package", pkg_name, ":", e$message, "\n")
    return(FALSE)
  })
}

# Check essential packages
essential_packages <- c("jsonlite", "yaml")
for (pkg in essential_packages) {
  if (!load_package(pkg)) {
    cat("CRITICAL: Essential package", pkg, "missing. Cannot continue.\n")
    quit(status = 1)
  }
}

# Check if test orchestrator exists
if (!file.exists("tests/utilities/test_orchestrator.R")) {
  cat("ERROR: test_orchestrator.R not found\n")
  cat("Available test files:\n")
  print(list.files("tests", recursive = TRUE, pattern = "\\.R$"))
  quit(status = 1)
}

# Load testing framework step by step
cat("Loading testing framework components...\n")

# Step 1: Load toy datasets
cat("1. Loading toy datasets...\n")
tryCatch({
  source("tests/data/toy_datasets.R")
  cat("   SUCCESS: toy datasets loaded\n")
}, error = function(e) {
  cat("   ERROR:", e$message, "\n")
  quit(status = 1)
})

# Step 2: Load core test functions  
cat("2. Loading core test functions...\n")
tryCatch({
  source("tests/core/automated_tests.R")
  cat("   SUCCESS: automated tests loaded\n")
}, error = function(e) {
  cat("   ERROR:", e$message, "\n")
  quit(status = 1)
})

# Step 3: Run smoke test first
cat("3. Running smoke test...\n")
tryCatch({
  smoke_results <- run_smoke_test()
  cat("   Smoke test status:", smoke_results$overall_status, "\n")
  
  if (smoke_results$overall_status == "passed") {
    cat("   SUCCESS: Basic functionality working\n")
  } else {
    cat("   WARNING: Smoke test failed, but continuing...\n")
  }
  
  # Save smoke test results
  saveRDS(smoke_results, "smoke_test_results.rds")
  
}, error = function(e) {
  cat("   ERROR in smoke test:", e$message, "\n")
  cat("   Continuing with basic tests...\n")
})

# Step 4: Test a single module
cat("4. Testing single module (ciForMean)...\n")
tryCatch({
  # Test data input methods for one module
  test_result <- test_module_data_input("ciForMean", "one_sample_ttest")
  
  cat("   Input method test results:\n")
  cat("     Matrix input:", test_result$matrix_input$status, "\n")
  cat("     Paste input:", test_result$paste_input$status, "\n") 
  cat("     File upload:", test_result$file_upload$status, "\n")
  
  if (length(test_result$errors) == 0) {
    cat("   SUCCESS: Single module test passed\n")
  } else {
    cat("   WARNING: Single module test had errors:\n")
    for (error in test_result$errors) {
      cat("     -", error, "\n")
    }
  }
  
  # Save single module results
  saveRDS(test_result, "single_module_test.rds")
  
}, error = function(e) {
  cat("   ERROR in single module test:", e$message, "\n")
})

# Step 5: Try loading session manager and orchestrator
cat("5. Loading session management...\n")
tryCatch({
  source("tests/core/test_session_manager.R")
  source("tests/utilities/test_orchestrator.R")
  cat("   SUCCESS: session management loaded\n")
  
  # Check for incomplete sessions
  cat("6. Checking for incomplete sessions...\n")
  incomplete <- check_for_incomplete_sessions()
  if (is.null(incomplete)) {
    cat("   No incomplete sessions found\n")
  } else {
    cat("   Found", nrow(incomplete), "incomplete sessions\n")
  }
  
}, error = function(e) {
  cat("   ERROR loading session management:", e$message, "\n")
  cat("   Skipping orchestrator test\n")
})

cat("\n=== Testing Framework Validation Complete ===\n")
cat("Check the following output files:\n")
cat("  - smoke_test_results.rds\n") 
cat("  - single_module_test.rds\n")
cat("Completed at:", format(Sys.time()), "\n")