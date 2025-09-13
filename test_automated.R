# Test Automated Tests Loading
# This script tests just the automated_tests.R file

cat("=== Testing Automated Tests Loading ===\n")

# Test loading automated tests specifically
cat("Loading automated tests...\n")
tryCatch({
  source("tests/core/automated_tests.R")
  cat("SUCCESS: automated_tests.R loaded\n")
  
  # Check if key functions exist
  functions_to_check <- c(
    "test_module_data_input",
    "test_statistical_calculations", 
    "run_complete_test_suite",
    "run_smoke_test"
  )
  
  cat("Checking for required functions:\n")
  for (func in functions_to_check) {
    exists <- exists(func)
    cat("  ", func, ":", ifelse(exists, "EXISTS", "MISSING"), "\n")
  }
  
  # Try running smoke test
  if (exists("run_smoke_test")) {
    cat("Attempting smoke test...\n")
    smoke_results <- run_smoke_test()
    cat("Smoke test status:", smoke_results$overall_status, "\n")
  }
  
}, error = function(e) {
  cat("ERROR loading automated tests:", e$message, "\n")
  cat("Call stack:\n")
  traceback()
})

cat("=== Test Complete ===\n")