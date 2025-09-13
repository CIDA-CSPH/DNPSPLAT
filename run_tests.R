# DNPSPLAT Testing Script
# This script runs the resilient testing suite

cat("=== DNPSPLAT Testing Suite ===\n")
cat("Starting tests at:", format(Sys.time()), "\n\n")

# Check if test files exist
if (!file.exists("tests/utilities/test_orchestrator.R")) {
  cat("ERROR: test_orchestrator.R not found\n")
  cat("Available test files:\n")
  print(list.files("tests", recursive = TRUE, pattern = "\\.R$"))
  quit(status = 1)
}

# Try to run a simple smoke test first
tryCatch({
  cat("Loading testing framework...\n")
  source("tests/utilities/test_orchestrator.R")
  
  cat("Running smoke test...\n")
  smoke_results <- run_smoke_test()
  
  if (smoke_results$overall_status == "passed") {
    cat("Smoke test passed! Running full test suite...\n")
    results <- run_resilient_test_suite()
    
    # Save results
    saveRDS(results, "test_results.rds")
    cat("Full testing completed successfully!\n")
    
  } else {
    cat("Smoke test failed. Check basic setup.\n")
    saveRDS(smoke_results, "smoke_test_results.rds")
  }
  
}, error = function(e) {
  cat("ERROR during testing:", e$message, "\n")
  cat("Traceback:\n")
  traceback()
  
  # Save error info
  error_info <- list(
    error_message = e$message,
    timestamp = Sys.time(),
    traceback = capture.output(traceback())
  )
  saveRDS(error_info, "test_error.rds")
  quit(status = 1)
})

cat("Testing script completed at:", format(Sys.time()), "\n")