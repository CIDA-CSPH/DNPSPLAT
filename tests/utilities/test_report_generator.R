# Test Report Generator for DNPSPLAT Testing Suite
# This file generates comprehensive HTML and text reports from test results

library(knitr)
library(rmarkdown)

#' Generate HTML Test Report
#' @param test_results List of test results from run_complete_test_suite()
#' @param output_file Character string specifying output file path
#' @return Path to generated HTML report
generate_html_report <- function(test_results, output_file = NULL) {
  
  if (is.null(output_file)) {
    timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
    output_file <- file.path("tests", paste0("test_report_", timestamp, ".html"))
  }
  
  # Create temporary Rmd file
  rmd_content <- create_rmd_content(test_results)
  temp_rmd <- tempfile(fileext = ".Rmd")
  writeLines(rmd_content, temp_rmd)
  
  # Render to HTML
  tryCatch({
    rmarkdown::render(temp_rmd, output_file = output_file, quiet = TRUE)
    cat("HTML report generated:", output_file, "\n")
    return(output_file)
  }, error = function(e) {
    cat("Error generating HTML report:", e$message, "\n")
    return(NULL)
  }, finally = {
    unlink(temp_rmd)
  })
}

#' Create R Markdown Content for Report
#' @param test_results List of test results
#' @return Character vector with Rmd content
create_rmd_content <- function(test_results) {
  
  rmd_lines <- c(
    "---",
    "title: 'DNPSPLAT Testing Report'",
    paste("date:", paste("'", Sys.Date(), "'")),
    "output:",
    "  html_document:",
    "    toc: true",
    "    toc_float: true", 
    "    theme: flatly",
    "    highlight: tango",
    "---",
    "",
    "```{r setup, include=FALSE}",
    "knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)",
    "library(knitr)",
    "library(DT)",
    "```",
    "",
    "# Executive Summary",
    "",
    paste("**Test Run Date:** ", format(test_results$timestamp, "%Y-%m-%d %H:%M:%S")),
    "",
    paste("**Total Modules Tested:** ", test_results$summary$total_modules),
    paste("**Total Tests Executed:** ", test_results$summary$total_tests),
    paste("**Tests Passed:** ", test_results$summary$passed_tests),
    paste("**Tests Failed:** ", test_results$summary$failed_tests),
    "",
    paste("**Overall Status:** ", toupper(test_results$overall_status)),
    ""
  )
  
  # Add status indicator
  if (test_results$overall_status == "all_passed") {
    status_color <- "success"
    status_icon <- "✅"
  } else if (test_results$overall_status == "partial_failure") {
    status_color <- "warning"  
    status_icon <- "⚠️"
  } else {
    status_color <- "danger"
    status_icon <- "❌"
  }
  
  rmd_lines <- c(rmd_lines,
    paste0('<div class="alert alert-', status_color, '">', status_icon, ' ', 
           "**Status:** ", gsub("_", " ", toupper(test_results$overall_status)), "</div>"),
    ""
  )
  
  # Success rate
  success_rate <- round((test_results$summary$passed_tests / test_results$summary$total_tests) * 100, 1)
  rmd_lines <- c(rmd_lines,
    paste("**Success Rate:** ", success_rate, "%"),
    ""
  )
  
  # Module-by-module results
  rmd_lines <- c(rmd_lines,
    "# Module Test Results",
    ""
  )
  
  for (module_name in names(test_results$module_results)) {
    module_results <- test_results$module_results[[module_name]]
    
    rmd_lines <- c(rmd_lines,
      paste("##", module_name),
      ""
    )
    
    for (test_type in names(module_results)) {
      test_data <- module_results[[test_type]]
      
      rmd_lines <- c(rmd_lines,
        paste("###", test_type),
        ""
      )
      
      # Input method tests
      input_results <- test_data$input_tests
      rmd_lines <- c(rmd_lines,
        "#### Data Input Methods",
        ""
      )
      
      # Create input methods table
      input_table <- data.frame(
        Method = c("Matrix Input", "Paste Input", "File Upload"),
        Status = c(
          ifelse(is.null(input_results$matrix_input$status), "Not Tested", input_results$matrix_input$status),
          ifelse(is.null(input_results$paste_input$status), "Not Tested", input_results$paste_input$status),
          ifelse(is.null(input_results$file_upload$status), "Not Tested", input_results$file_upload$status)
        ),
        Details = c(
          ifelse(input_results$matrix_input$status == "success", 
                paste("Data points:", input_results$matrix_input$data_points), 
                ifelse(is.null(input_results$matrix_input$message), "", input_results$matrix_input$message)),
          ifelse(input_results$paste_input$status == "success",
                paste("Data points:", input_results$paste_input$data_points),
                ifelse(is.null(input_results$paste_input$message), "", input_results$paste_input$message)),
          ifelse(input_results$file_upload$status == "success",
                paste("File size:", input_results$file_upload$file_size, "bytes"),
                ifelse(is.null(input_results$file_upload$message), "", input_results$file_upload$message))
        ),
        stringsAsFactors = FALSE
      )
      
      rmd_lines <- c(rmd_lines,
        "```{r}",
        "input_table <- data.frame(",
        paste("  Method = c(", paste(paste0('"', input_table$Method, '"'), collapse = ", "), "),"),
        paste("  Status = c(", paste(paste0('"', input_table$Status, '"'), collapse = ", "), "),"),  
        paste("  Details = c(", paste(paste0('"', gsub('"', "'", input_table$Details), '"'), collapse = ", "), ")"),
        ")",
        "kable(input_table)",
        "```",
        ""
      )
      
      # Statistical calculations
      calc_results <- test_data$calculation_tests
      rmd_lines <- c(rmd_lines,
        "#### Statistical Calculations",
        ""
      )
      
      if (length(calc_results$errors) == 0 && !is.null(calc_results$calculation_results)) {
        rmd_lines <- c(rmd_lines,
          "**Status:** ✅ PASSED",
          "",
          "**Results:**",
          ""
        )
        
        # Format calculation results
        calc_df <- data.frame(
          Parameter = names(calc_results$calculation_results),
          Value = sapply(calc_results$calculation_results, function(x) {
            if (is.numeric(x)) {
              if (abs(x) < 0.001 && x != 0) {
                sprintf("%.2e", x)
              } else {
                sprintf("%.4f", x) 
              }
            } else {
              as.character(x)
            }
          }),
          stringsAsFactors = FALSE
        )
        
        rmd_lines <- c(rmd_lines,
          "```{r}",
          "calc_df <- data.frame(",
          paste("  Parameter = c(", paste(paste0('"', calc_df$Parameter, '"'), collapse = ", "), "),"),
          paste("  Value = c(", paste(paste0('"', calc_df$Value, '"'), collapse = ", "), ")"),
          ")",
          "kable(calc_df)",
          "```",
          ""
        )
        
        # Validation results
        if (!is.null(calc_results$validation)) {
          validation <- calc_results$validation
          if (validation$overall_status == "pass") {
            rmd_lines <- c(rmd_lines,
              "**Validation:** ✅ All results match expected values",
              ""
            )
          } else {
            rmd_lines <- c(rmd_lines,
              "**Validation:** ❌ Some results don't match expected values",
              "",
              "**Mismatches:**",
              paste("- ", validation$mismatches),
              ""
            )
          }
        }
        
      } else {
        rmd_lines <- c(rmd_lines,
          "**Status:** ❌ FAILED",
          "",
          "**Errors:**",
          paste("- ", calc_results$errors),
          ""
        )
      }
      
      rmd_lines <- c(rmd_lines, "---", "")
    }
  }
  
  # Summary table
  rmd_lines <- c(rmd_lines,
    "# Summary Table",
    "",
    "```{r}",
    "# Create summary table",
    create_summary_table_code(test_results),
    "DT::datatable(summary_df, options = list(pageLength = 20))",
    "```",
    ""
  )
  
  # Recommendations
  rmd_lines <- c(rmd_lines,
    "# Recommendations",
    ""
  )
  
  if (test_results$summary$failed_tests > 0) {
    rmd_lines <- c(rmd_lines,
      "## Priority Actions",
      "",
      "1. **Investigate Failed Modules:** Focus on modules with calculation errors",
      "2. **Data Input Validation:** Implement better error handling for data input methods", 
      "3. **Missing Dependencies:** Check for missing R packages or functions",
      "4. **Environment Issues:** Compare local vs production environment differences",
      "",
      "## Next Steps",
      "",
      "1. Run individual module tests to isolate specific issues",
      "2. Check server logs for detailed error messages",
      "3. Test with different browsers and input methods",
      "4. Validate data format requirements",
      ""
    )
  } else {
    rmd_lines <- c(rmd_lines,
      "## All Tests Passed! ✅",
      "",
      "The application appears to be functioning correctly. Consider:",
      "",
      "1. **Regular Testing:** Schedule periodic automated testing",
      "2. **User Acceptance Testing:** Have end users test critical workflows",
      "3. **Performance Monitoring:** Monitor response times and resource usage", 
      "4. **Documentation:** Update user guides based on test findings",
      ""
    )
  }
  
  rmd_lines <- c(rmd_lines,
    "---",
    "",
    paste("*Report generated on", Sys.time(), "*"),
    ""
  )
  
  return(rmd_lines)
}

#' Create Summary Table Code for R Markdown
#' @param test_results List of test results
#' @return Character string with R code to create summary table
create_summary_table_code <- function(test_results) {
  
  # Extract summary data for each module and test type
  summary_rows <- c()
  
  for (module_name in names(test_results$module_results)) {
    module_results <- test_results$module_results[[module_name]]
    
    for (test_type in names(module_results)) {
      test_data <- module_results[[test_type]]
      
      # Input methods status
      input_status <- "PASS"
      if (length(test_data$input_tests$errors) > 0) {
        input_status <- "FAIL"
      }
      
      # Calculation status  
      calc_status <- "PASS"
      if (length(test_data$calculation_tests$errors) > 0) {
        calc_status <- "FAIL"
      }
      
      # Overall status
      overall_status <- ifelse(input_status == "PASS" && calc_status == "PASS", "PASS", "FAIL")
      
      summary_rows <- c(summary_rows,
        paste0('  c("', module_name, '", "', test_type, '", "', 
               input_status, '", "', calc_status, '", "', overall_status, '")')
      )
    }
  }
  
  code <- c(
    "summary_df <- data.frame(",
    "  Module = character(0),",
    "  TestType = character(0),", 
    "  InputMethods = character(0),",
    "  Calculations = character(0),",
    "  Overall = character(0),",
    "  stringsAsFactors = FALSE",
    ")",
    "",
    if (length(summary_rows) > 0) {
      c("summary_df <- rbind(summary_df,",
        paste("  ", summary_rows, collapse = ",\n"),
        ")")
    } else {
      "# No test results to display"
    },
    "",
    "names(summary_df) <- c('Module', 'Test Type', 'Input Methods', 'Calculations', 'Overall')"
  )
  
  return(paste(code, collapse = "\n"))
}

#' Generate Text Report
#' @param test_results List of test results from run_complete_test_suite()
#' @param output_file Character string specifying output file path  
#' @return Path to generated text report
generate_text_report <- function(test_results, output_file = NULL) {
  
  if (is.null(output_file)) {
    timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
    output_file <- file.path("tests", paste0("test_report_", timestamp, ".txt"))
  }
  
  report_lines <- c(
    "==================================================",
    "           DNPSPLAT TESTING REPORT",
    "==================================================",
    "",
    paste("Test Run Date:", format(test_results$timestamp, "%Y-%m-%d %H:%M:%S")),
    "",
    "EXECUTIVE SUMMARY",
    "-----------------",
    paste("Total Modules Tested:", test_results$summary$total_modules),
    paste("Total Tests Executed:", test_results$summary$total_tests), 
    paste("Tests Passed:", test_results$summary$passed_tests),
    paste("Tests Failed:", test_results$summary$failed_tests),
    paste("Success Rate:", round((test_results$summary$passed_tests / test_results$summary$total_tests) * 100, 1), "%"),
    paste("Overall Status:", toupper(gsub("_", " ", test_results$overall_status))),
    "",
    "DETAILED RESULTS",
    "================",
    ""
  )
  
  for (module_name in names(test_results$module_results)) {
    module_results <- test_results$module_results[[module_name]]
    
    report_lines <- c(report_lines,
      paste("MODULE:", module_name),
      paste(rep("-", nchar(module_name) + 7), collapse = ""),
      ""
    )
    
    for (test_type in names(module_results)) {
      test_data <- module_results[[test_type]]
      
      report_lines <- c(report_lines,
        paste("  Test Type:", test_type),
        ""
      )
      
      # Input methods
      input_results <- test_data$input_tests
      report_lines <- c(report_lines,
        "    Data Input Methods:",
        paste("      Matrix Input:", input_results$matrix_input$status),
        paste("      Paste Input:", input_results$paste_input$status),
        paste("      File Upload:", input_results$file_upload$status),
        ""
      )
      
      if (length(input_results$errors) > 0) {
        report_lines <- c(report_lines,
          "    Input Errors:",
          paste("      -", input_results$errors),
          ""
        )
      }
      
      # Statistical calculations
      calc_results <- test_data$calculation_tests
      calc_status <- ifelse(length(calc_results$errors) == 0, "PASSED", "FAILED")
      
      report_lines <- c(report_lines,
        paste("    Statistical Calculations:", calc_status),
        ""
      )
      
      if (length(calc_results$errors) > 0) {
        report_lines <- c(report_lines,
          "    Calculation Errors:",
          paste("      -", calc_results$errors),
          ""
        )
      }
      
      if (!is.null(calc_results$validation)) {
        validation_status <- ifelse(calc_results$validation$overall_status == "pass", "PASSED", "FAILED")
        report_lines <- c(report_lines,
          paste("    Result Validation:", validation_status),
          ""
        )
        
        if (length(calc_results$validation$mismatches) > 0) {
          report_lines <- c(report_lines,
            "    Validation Issues:",
            paste("      -", calc_results$validation$mismatches),
            ""
          )
        }
      }
      
      report_lines <- c(report_lines, "")
    }
    
    report_lines <- c(report_lines, "")
  }
  
  # Recommendations
  report_lines <- c(report_lines,
    "RECOMMENDATIONS",
    "===============",
    ""
  )
  
  if (test_results$summary$failed_tests > 0) {
    report_lines <- c(report_lines,
      "PRIORITY ACTIONS:",
      "1. Investigate failed modules with calculation errors",
      "2. Implement better error handling for data input methods",
      "3. Check for missing R packages or functions", 
      "4. Compare local vs production environment differences",
      "",
      "NEXT STEPS:",
      "1. Run individual module tests to isolate specific issues",
      "2. Check server logs for detailed error messages",
      "3. Test with different browsers and input methods",
      "4. Validate data format requirements",
      ""
    )
  } else {
    report_lines <- c(report_lines,
      "All tests passed successfully!",
      "",
      "MAINTENANCE RECOMMENDATIONS:",
      "1. Schedule periodic automated testing",
      "2. Have end users test critical workflows", 
      "3. Monitor response times and resource usage",
      "4. Update user guides based on test findings",
      ""
    )
  }
  
  report_lines <- c(report_lines,
    "==================================================",
    paste("Report generated on", Sys.time()),
    "=================================================="
  )
  
  # Write to file
  writeLines(report_lines, output_file)
  cat("Text report generated:", output_file, "\n")
  
  return(output_file)
}

#' Generate CSV Summary Report
#' @param test_results List of test results from run_complete_test_suite()
#' @param output_file Character string specifying output file path
#' @return Path to generated CSV file
generate_csv_summary <- function(test_results, output_file = NULL) {
  
  if (is.null(output_file)) {
    timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
    output_file <- file.path("tests", paste0("test_summary_", timestamp, ".csv"))
  }
  
  summary_data <- data.frame(
    timestamp = character(0),
    module = character(0),
    test_type = character(0),
    matrix_input = character(0),
    paste_input = character(0), 
    file_upload = character(0),
    calculation_status = character(0),
    validation_status = character(0),
    overall_status = character(0),
    errors = character(0),
    stringsAsFactors = FALSE
  )
  
  for (module_name in names(test_results$module_results)) {
    module_results <- test_results$module_results[[module_name]]
    
    for (test_type in names(module_results)) {
      test_data <- module_results[[test_type]]
      
      input_results <- test_data$input_tests
      calc_results <- test_data$calculation_tests
      
      calc_status <- ifelse(length(calc_results$errors) == 0, "PASS", "FAIL")
      validation_status <- if (!is.null(calc_results$validation)) {
        ifelse(calc_results$validation$overall_status == "pass", "PASS", "FAIL")
      } else {
        "N/A"
      }
      
      overall_status <- ifelse(
        length(input_results$errors) == 0 && length(calc_results$errors) == 0, 
        "PASS", "FAIL"
      )
      
      all_errors <- c(input_results$errors, calc_results$errors)
      error_summary <- if (length(all_errors) > 0) {
        paste(all_errors, collapse = "; ")
      } else {
        ""
      }
      
      summary_data <- rbind(summary_data, data.frame(
        timestamp = format(test_results$timestamp, "%Y-%m-%d %H:%M:%S"),
        module = module_name,
        test_type = test_type,
        matrix_input = input_results$matrix_input$status,
        paste_input = input_results$paste_input$status,
        file_upload = input_results$file_upload$status,
        calculation_status = calc_status,
        validation_status = validation_status,
        overall_status = overall_status,
        errors = error_summary,
        stringsAsFactors = FALSE
      ))
    }
  }
  
  write.csv(summary_data, output_file, row.names = FALSE)
  cat("CSV summary generated:", output_file, "\n")
  
  return(output_file)
}

#' Generate All Report Types
#' @param test_results List of test results from run_complete_test_suite()
#' @param output_dir Directory for output files
#' @return List of generated file paths
generate_all_reports <- function(test_results, output_dir = "tests") {
  
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }
  
  timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
  
  reports <- list(
    html = file.path(output_dir, paste0("test_report_", timestamp, ".html")),
    text = file.path(output_dir, paste0("test_report_", timestamp, ".txt")),
    csv = file.path(output_dir, paste0("test_summary_", timestamp, ".csv"))
  )
  
  cat("Generating comprehensive test reports...\n")
  
  # Generate HTML report
  tryCatch({
    reports$html <- generate_html_report(test_results, reports$html)
  }, error = function(e) {
    cat("Failed to generate HTML report:", e$message, "\n")
    reports$html <- NULL
  })
  
  # Generate text report  
  tryCatch({
    reports$text <- generate_text_report(test_results, reports$text)
  }, error = function(e) {
    cat("Failed to generate text report:", e$message, "\n")
    reports$text <- NULL
  })
  
  # Generate CSV summary
  tryCatch({
    reports$csv <- generate_csv_summary(test_results, reports$csv)
  }, error = function(e) {
    cat("Failed to generate CSV summary:", e$message, "\n")
    reports$csv <- NULL
  })
  
  cat("Report generation completed.\n")
  return(reports)
}