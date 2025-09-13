# DNPSPLAT Statistical Validation Testing
cat("=== DNPSPLAT Statistical Validation ===\n")

# Load framework
source("tests/data/toy_datasets.R")
source("tests/core/automated_tests.R")
source("tests/core/expected_results.R")

# Test statistical calculations
test_types <- c(
  "one_sample_ttest",
  "two_sample_ttest", 
  "paired_ttest",
  "ci_proportion",
  "contingency_2x2",
  "descriptive_stats"
)

results <- list()
summary <- list(passed = 0, failed = 0, total = length(test_types))

for (test_type in test_types) {
  cat("Testing statistical calculations for:", test_type, "\n")
  
  tryCatch({
    # Get expected results
    expected <- get_expected_results(test_type)
    
    # Run statistical test
    calc_result <- test_statistical_calculations(test_type, expected)
    
    # Check for errors
    has_errors <- length(calc_result$errors) > 0
    
    if (!has_errors && !is.null(calc_result$calculation_results)) {
      summary$passed <- summary$passed + 1
      cat("  ✓ PASSED - Statistical calculations work\n")
      
      # Show some key results
      if (!is.null(calc_result$calculation_results$p_value)) {
        cat("    P-value:", round(calc_result$calculation_results$p_value, 4), "\n")
      }
      if (!is.null(calc_result$calculation_results$mean)) {
        cat("    Mean:", round(calc_result$calculation_results$mean, 3), "\n")
      }
      
    } else {
      summary$failed <- summary$failed + 1
      cat("  ✗ FAILED\n")
      if (has_errors) {
        cat("    Errors:", paste(calc_result$errors, collapse = "; "), "\n")
      }
    }
    
    results[[test_type]] <- calc_result
    
  }, error = function(e) {
    summary$failed <<- summary$failed + 1
    cat("  ✗ ERROR:", e$message, "\n")
    results[[test_type]] <<- list(status = "ERROR", message = e$message)
  })
  
  cat("\n")
}

# Save results
saveRDS(results, "statistical_test_results.rds")

# Print summary  
cat("=== STATISTICAL TESTING SUMMARY ===\n")
cat("Total test types:", summary$total, "\n")
cat("Calculations passed:", summary$passed, "\n")
cat("Calculations failed:", summary$failed, "\n")
cat("Statistical success rate:", round(summary$passed/summary$total*100, 1), "%\n")

saveRDS(summary, "statistical_summary.rds")

cat("\nResults saved to:\n")
cat("- statistical_test_results.rds\n")
cat("- statistical_summary.rds\n")
cat("=== Statistical Testing Complete ===\n")