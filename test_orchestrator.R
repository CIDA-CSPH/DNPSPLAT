# Enhanced DNPSPLAT Testing Suite - Statistical + UI Testing
cat("=== DNPSPLAT COMPREHENSIVE TESTING SUITE ===\n")
cat("Layers: Statistical Validation + UI Interaction Testing\n")

# Load framework
source("tests/data/toy_datasets.R")
source("tests/core/automated_tests.R")

# Check if UI testing is available
ui_testing_available <- FALSE
if (file.exists("tests/ui/setup-shinytest2.R")) {
  tryCatch({
    source("tests/ui/setup-shinytest2.R")
    ui_testing_available <- TRUE
    cat("UI testing with shinytest2: ENABLED\n")
  }, error = function(e) {
    cat("UI testing with shinytest2: UNAVAILABLE (", e$message, ")\n")
  })
} else {
  cat("UI testing with shinytest2: NOT INSTALLED\n")
}

# Test all key modules
modules <- list(
  "ciForMean" = "one_sample_ttest",
  "ciForProportion" = "ci_proportion", 
  "twoSampleTTest" = "two_sample_ttest",
  "pairedTTest2" = "paired_ttest",
  "contTable2" = "contingency_2x2",
  "descrStats" = "descriptive_stats"
)

# Initialize comprehensive results structure
comprehensive_results <- list(
  timestamp = Sys.time(),
  statistical = list(),
  ui = list(),
  summary = list(
    statistical = list(passed = 0, failed = 0, total = length(modules)),
    ui = list(passed = 0, failed = 0, total = 0),
    overall = list(passed = 0, failed = 0, total = 0)
  )
)

cat("\n=== LAYER 1: STATISTICAL VALIDATION TESTING ===\n")

for (module_name in names(modules)) {
  test_type <- modules[[module_name]]
  cat("Testing module:", module_name, "with", test_type, "\n")
  
  tryCatch({
    result <- test_module_data_input(module_name, test_type)
    comprehensive_results$statistical[[module_name]] <- result
    
    # Check status
    has_errors <- length(result$errors) > 0
    status <- ifelse(has_errors, "FAIL", "PASS")
    
    if (status == "PASS") {
      comprehensive_results$summary$statistical$passed <- comprehensive_results$summary$statistical$passed + 1
      cat("  ✓ PASSED\n")
    } else {
      comprehensive_results$summary$statistical$failed <- comprehensive_results$summary$statistical$failed + 1
      cat("  ✗ FAILED -", paste(result$errors, collapse = "; "), "\n")
    }
    
    # Show input method results
    cat("    Matrix input:", result$matrix_input$status, "\n")
    cat("    Paste input:", result$paste_input$status, "\n")
    cat("    File upload:", result$file_upload$status, "\n")
    
  }, error = function(e) {
    comprehensive_results$summary$statistical$failed <<- comprehensive_results$summary$statistical$failed + 1
    cat("  ✗ ERROR:", e$message, "\n")
    comprehensive_results$statistical[[module_name]] <<- list(status = "ERROR", message = e$message)
  })
  
  cat("\n")
}

# LAYER 2: UI TESTING (if available)
if (ui_testing_available) {
  cat("\n=== LAYER 2: UI INTERACTION TESTING ===\n")
  
  tryCatch({
    # Run UI tests using the same modules and datasets
    ui_results <- run_ui_tests(headless = TRUE, modules = modules)
    comprehensive_results$ui <- ui_results
    
    # Update UI summary
    if (!is.null(ui_results) && !is.null(ui_results$error)) {
      comprehensive_results$summary$ui$total <- length(modules)
      comprehensive_results$summary$ui$failed <- length(modules)
      cat("UI Testing encountered critical error:", ui_results$error, "\n")
    } else {
      for (module_name in names(ui_results)) {
        comprehensive_results$summary$ui$total <- comprehensive_results$summary$ui$total + 1
        
        if (ui_results[[module_name]]$status == "PASS") {
          comprehensive_results$summary$ui$passed <- comprehensive_results$summary$ui$passed + 1
          cat("UI Test for", module_name, ": ✓ PASSED\n")
        } else {
          comprehensive_results$summary$ui$failed <- comprehensive_results$summary$ui$failed + 1
          cat("UI Test for", module_name, ": ✗ FAILED -", ui_results[[module_name]]$status, "\n")
        }
      }
    }
    
    # Run specific McNemar's UI test if available
    if (file.exists("tests/ui/test-ui-mcnemars.R")) {
      cat("\n=== SPECIFIC McNEMAR'S ISSUE TESTING ===\n")
      source("tests/ui/test-ui-mcnemars.R")
      
      mcnemars_ui_result <- test_mcnemars_ui(headless = TRUE)
      comprehensive_results$mcnemars_specific <- mcnemars_ui_result
      
      if (mcnemars_ui_result$status == "COMPLETED") {
        if (mcnemars_ui_result$summary$specific_issue_reproduced) {
          cat("✓ Successfully reproduced the 'nonnegative and finite' error\n")
        } else {
          cat("ℹ Could not reproduce the specific error (may be fixed or different setup)\n")
        }
      } else {
        cat("✗ McNemar's specific test failed:", mcnemars_ui_result$status, "\n")
      }
    }
    
  }, error = function(e) {
    cat("UI Testing failed:", e$message, "\n")
    comprehensive_results$ui <<- list(error = e$message)
  })
} else {
  cat("\n=== LAYER 2: UI TESTING SKIPPED ===\n")
  cat("shinytest2 not available. Install with: install.packages('shinytest2')\n")
}

# Calculate overall summary
comprehensive_results$summary$overall$total <- 
  comprehensive_results$summary$statistical$total + comprehensive_results$summary$ui$total
comprehensive_results$summary$overall$passed <- 
  comprehensive_results$summary$statistical$passed + comprehensive_results$summary$ui$passed
comprehensive_results$summary$overall$failed <- 
  comprehensive_results$summary$statistical$failed + comprehensive_results$summary$ui$failed

# Save comprehensive results
saveRDS(comprehensive_results, "comprehensive_test_results.rds")

# Save backwards-compatible results for existing scripts
saveRDS(comprehensive_results$statistical, "module_test_results.rds")
saveRDS(comprehensive_results$summary$statistical, "test_summary.rds")

# Print comprehensive summary
cat("\n=== COMPREHENSIVE TESTING SUMMARY ===\n")
cat("Statistical Tests:\n")
cat("  Total modules tested:", comprehensive_results$summary$statistical$total, "\n")
cat("  Passed:", comprehensive_results$summary$statistical$passed, "\n") 
cat("  Failed:", comprehensive_results$summary$statistical$failed, "\n")
cat("  Success rate:", round(comprehensive_results$summary$statistical$passed/comprehensive_results$summary$statistical$total*100, 1), "%\n")

if (comprehensive_results$summary$ui$total > 0) {
  cat("\nUI Interaction Tests:\n")
  cat("  Total modules tested:", comprehensive_results$summary$ui$total, "\n")
  cat("  Passed:", comprehensive_results$summary$ui$passed, "\n")
  cat("  Failed:", comprehensive_results$summary$ui$failed, "\n")
  cat("  Success rate:", round(comprehensive_results$summary$ui$passed/comprehensive_results$summary$ui$total*100, 1), "%\n")
}

cat("\nOVERALL RESULTS:\n")
cat("  Total tests:", comprehensive_results$summary$overall$total, "\n")
cat("  Passed:", comprehensive_results$summary$overall$passed, "\n")
cat("  Failed:", comprehensive_results$summary$overall$failed, "\n")
cat("  Overall success rate:", round(comprehensive_results$summary$overall$passed/comprehensive_results$summary$overall$total*100, 1), "%\n")

cat("\nResults saved to:\n")
cat("- comprehensive_test_results.rds (full results)\n")
cat("- module_test_results.rds (statistical only, backwards compatible)\n")
cat("- test_summary.rds (statistical summary, backwards compatible)\n")

if (ui_testing_available && dir.exists("tests/screenshots")) {
  cat("- tests/screenshots/ (UI test screenshots)\n")
}

cat("\n=== COMPREHENSIVE TESTING COMPLETE ===\n")