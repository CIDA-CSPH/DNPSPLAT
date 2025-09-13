# Minimal Test Runner for DNPSPLAT
# This script tests just the basic file loading and function availability

cat("=== DNPSPLAT Minimal Test ===\n")
cat("Working directory:", getwd(), "\n")

# Check if required files exist
required_files <- c(
  "tests/data/toy_datasets.R",
  "tests/core/automated_tests.R", 
  "tests/core/expected_results.R",
  "tests/core/test_logger.R",
  "tests/core/test_session_manager.R",
  "tests/utilities/test_orchestrator.R"
)

cat("\nChecking required files:\n")
all_files_exist <- TRUE
for (file in required_files) {
  exists <- file.exists(file)
  cat("  ", file, ":", ifelse(exists, "EXISTS", "MISSING"), "\n")
  if (!exists) all_files_exist <- FALSE
}

if (!all_files_exist) {
  cat("\nERROR: Some required files are missing!\n")
  quit(status = 1)
}

# Try loading each file individually
cat("\nTesting individual file loading:\n")

# Test 1: Load toy datasets
cat("1. Loading toy datasets...\n")
tryCatch({
  source("tests/data/toy_datasets.R")
  cat("   SUCCESS: toy datasets loaded\n")
  
  # Test a function
  if (exists("get_test_data")) {
    test_data <- get_test_data("one_sample_ttest")
    cat("   SUCCESS: get_test_data() works, got", length(test_data$data), "data points\n")
  } else {
    cat("   WARNING: get_test_data() function not found\n")
  }
}, error = function(e) {
  cat("   ERROR loading toy datasets:", e$message, "\n")
})

# Test 2: Load logger
cat("2. Loading test logger...\n")
tryCatch({
  source("tests/core/test_logger.R")
  cat("   SUCCESS: test logger loaded\n")
  
  if (exists("init_logger")) {
    cat("   SUCCESS: init_logger() function available\n")
  } else {
    cat("   WARNING: init_logger() function not found\n")
  }
}, error = function(e) {
  cat("   ERROR loading test logger:", e$message, "\n")
})

# Test 3: Load expected results
cat("3. Loading expected results...\n")
tryCatch({
  source("tests/core/expected_results.R")
  cat("   SUCCESS: expected results loaded\n")
  
  if (exists("get_expected_results")) {
    expected <- get_expected_results("one_sample_ttest")
    cat("   SUCCESS: get_expected_results() works\n")
  } else {
    cat("   WARNING: get_expected_results() function not found\n")
  }
}, error = function(e) {
  cat("   ERROR loading expected results:", e$message, "\n")
})

# Test 4: Check package availability
cat("4. Checking required packages...\n")
required_packages <- c("jsonlite", "yaml", "testthat", "shiny", "openxlsx")
for (pkg in required_packages) {
  available <- requireNamespace(pkg, quietly = TRUE)
  cat("   ", pkg, ":", ifelse(available, "AVAILABLE", "MISSING"), "\n")
}

cat("\n=== Minimal Test Complete ===\n")
cat("If all tests above succeeded, the framework should work.\n")