# DNPSPLAT Master Test Runner
# Single command to run comprehensive testing suite
# Combines statistical validation with UI interaction testing

cat("=== DNPSPLAT MASTER TEST RUNNER ===\n")
cat("Comprehensive testing with statistical validation + UI automation\n\n")

# Check and install required packages
required_packages <- c("shinytest2", "chromote", "testthat")
missing_packages <- character(0)

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    missing_packages <- c(missing_packages, pkg)
  }
}

if (length(missing_packages) > 0) {
  cat("Installing missing packages:", paste(missing_packages, collapse = ", "), "\n")
  install.packages(missing_packages)
  
  # Load them after installation
  for (pkg in missing_packages) {
    library(pkg, character.only = TRUE, quietly = TRUE)
  }
}

# Set working directory to project root (if not already there)
if (file.exists("app.R")) {
  cat("✓ Found app.R - we're in the project root\n")
} else if (file.exists("../app.R")) {
  setwd("..")
  cat("✓ Changed to project root\n")
} else {
  stop("ERROR: Cannot find app.R. Please run this script from the DNPSPLAT project directory.")
}

# Run the comprehensive test orchestrator
cat("\nStarting comprehensive test suite...\n")
cat("This will run:\n")
cat("1. Statistical validation tests (existing framework)\n") 
cat("2. UI interaction tests with shinytest2\n")
cat("3. Specific McNemar's issue testing\n\n")

# Record start time
start_time <- Sys.time()

# Run the enhanced test orchestrator
tryCatch({
  source("test_orchestrator.R")
  
  # Calculate runtime
  end_time <- Sys.time()
  runtime <- difftime(end_time, start_time, units = "mins")
  
  cat(sprintf("\n=== TESTING COMPLETED IN %.1f MINUTES ===\n", as.numeric(runtime)))
  
  # Show final results summary
  if (exists("comprehensive_results")) {
    cat("\nFINAL SUMMARY:\n")
    cat("Statistical Tests:", comprehensive_results$summary$statistical$passed, "/", 
        comprehensive_results$summary$statistical$total, "\n")
    
    if (comprehensive_results$summary$ui$total > 0) {
      cat("UI Tests:", comprehensive_results$summary$ui$passed, "/", 
          comprehensive_results$summary$ui$total, "\n")
    }
    
    cat("Overall Success Rate:", 
        round(comprehensive_results$summary$overall$passed/comprehensive_results$summary$overall$total*100, 1), 
        "%\n")
    
    # Check for McNemar's specific issue
    if (!is.null(comprehensive_results$mcnemars_specific)) {
      if (comprehensive_results$mcnemars_specific$summary$specific_issue_reproduced) {
        cat("\n⚠️  McNemar's 'nonnegative and finite' error WAS reproduced\n")
        cat("   This confirms the reported issue exists\n")
      } else {
        cat("\n✅ McNemar's 'nonnegative and finite' error was NOT reproduced\n")
        cat("   Issue may be resolved or environment-specific\n")
      }
    }
    
    # Show where to find detailed results
    cat("\nDetailed results available in:\n")
    cat("- comprehensive_test_results.rds (complete results)\n")
    
    if (dir.exists("tests/screenshots")) {
      screenshot_count <- length(list.files("tests/screenshots", pattern = "\\.png$", recursive = TRUE))
      cat("- tests/screenshots/ (", screenshot_count, " UI test screenshots)\n")
    }
    
    # Generate quick HTML report if possible
    if (require(knitr, quietly = TRUE) && require(rmarkdown, quietly = TRUE)) {
      cat("- Generating HTML report...\n")
      tryCatch({
        # Create a simple HTML summary
        generate_html_summary(comprehensive_results)
        cat("- test_summary.html (open in browser)\n")
      }, error = function(e) {
        cat("- HTML report generation failed:", e$message, "\n")
      })
    }
    
  } else {
    cat("ERROR: comprehensive_results not found. Testing may have failed.\n")
  }
  
}, error = function(e) {
  end_time <- Sys.time()
  runtime <- difftime(end_time, start_time, units = "mins")
  
  cat(sprintf("\n=== TESTING FAILED AFTER %.1f MINUTES ===\n", as.numeric(runtime)))
  cat("ERROR:", e$message, "\n")
  cat("\nTroubleshooting:\n")
  cat("1. Check that the Shiny app starts correctly: shiny::runApp()\n")
  cat("2. Verify all dependencies are installed\n")
  cat("3. Check if Chrome/Chromium is available for shinytest2\n")
  cat("4. Try running statistical tests only first\n")
})

#' Generate Simple HTML Summary Report
#' @param results Comprehensive test results
generate_html_summary <- function(results) {
  
  html_content <- paste0(
    "<html><head><title>DNPSPLAT Test Results</title>",
    "<style>",
    "body { font-family: Arial, sans-serif; margin: 20px; }",
    ".pass { color: green; font-weight: bold; }",
    ".fail { color: red; font-weight: bold; }",
    ".section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; }",
    ".summary { background: #f5f5f5; }",
    "</style></head><body>",
    
    "<h1>DNPSPLAT Comprehensive Test Results</h1>",
    "<p>Generated: ", format(Sys.time()), "</p>",
    
    # Overall Summary
    "<div class='section summary'>",
    "<h2>Overall Summary</h2>",
    "<p>Total Tests: ", results$summary$overall$total, "</p>",
    "<p>Passed: <span class='pass'>", results$summary$overall$passed, "</span></p>",
    "<p>Failed: <span class='fail'>", results$summary$overall$failed, "</span></p>",
    "<p>Success Rate: ", round(results$summary$overall$passed/results$summary$overall$total*100, 1), "%</p>",
    "</div>",
    
    # Statistical Tests
    "<div class='section'>",
    "<h2>Statistical Validation Tests</h2>",
    "<p>Passed: ", results$summary$statistical$passed, "/", results$summary$statistical$total, "</p>"
  )
  
  # Add module details
  for (module in names(results$statistical)) {
    status_class <- ifelse(length(results$statistical[[module]]$errors) == 0, "pass", "fail")
    html_content <- paste0(html_content,
      "<p>", module, ": <span class='", status_class, "'>",
      ifelse(length(results$statistical[[module]]$errors) == 0, "PASS", "FAIL"),
      "</span></p>"
    )
  }
  
  html_content <- paste0(html_content, "</div>")
  
  # UI Tests (if available)
  if (results$summary$ui$total > 0) {
    html_content <- paste0(html_content,
      "<div class='section'>",
      "<h2>UI Interaction Tests</h2>",
      "<p>Passed: ", results$summary$ui$passed, "/", results$summary$ui$total, "</p>"
    )
    
    for (module in names(results$ui)) {
      if (!is.null(results$ui[[module]]$status)) {
        status_class <- ifelse(results$ui[[module]]$status == "PASS", "pass", "fail")
        html_content <- paste0(html_content,
          "<p>", module, ": <span class='", status_class, "'>", results$ui[[module]]$status, "</span></p>"
        )
      }
    }
    
    html_content <- paste0(html_content, "</div>")
  }
  
  # McNemar's specific test
  if (!is.null(results$mcnemars_specific)) {
    html_content <- paste0(html_content,
      "<div class='section'>",
      "<h2>McNemar's Specific Issue Test</h2>",
      "<p>Status: ", results$mcnemars_specific$status, "</p>",
      "<p>Issue Reproduced: ", 
      ifelse(results$mcnemars_specific$summary$specific_issue_reproduced, 
             "<span class='fail'>YES</span>", 
             "<span class='pass'>NO</span>"),
      "</p>",
      "</div>"
    )
  }
  
  html_content <- paste0(html_content, "</body></html>")
  
  writeLines(html_content, "test_summary.html")
}

cat("\n=== MASTER TEST RUNNER COMPLETE ===\n")
cat("To run this again: source('tests/master_test.R')\n")