# Final DNPSPLAT Test - Simple Version
cat("=== DNPSPLAT Final Test ===\n")

# Load framework
source("tests/data/toy_datasets.R")
source("tests/core/automated_tests.R")

# Test key modules
modules <- c("ciForMean", "twoSampleTTest", "pairedTTest2")
results <- list()

for (module in modules) {
  cat("Testing:", module, "\n")
  
  test_type <- switch(module,
    "ciForMean" = "one_sample_ttest",
    "twoSampleTTest" = "two_sample_ttest", 
    "pairedTTest2" = "paired_ttest"
  )
  
  result <- test_module_data_input(module, test_type)
  results[[module]] <- result
  
  status <- ifelse(length(result$errors) == 0, "PASS", "FAIL")
  cat("  Status:", status, "\n")
}

# Save results
saveRDS(results, "final_test_results.rds")
cat("Complete!\n")