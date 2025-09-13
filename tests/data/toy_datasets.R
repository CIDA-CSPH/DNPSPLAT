# Toy Datasets Library for DNPSPLAT Testing
# This file provides standardized datasets for systematic testing of all statistical modules

#' Get Test Data for Specific Analysis Types
#' @param test_type Character string specifying the type of analysis
#' @return List containing data and metadata for testing
get_test_data <- function(test_type) {
  switch(test_type,
    
    # One-sample t-tests and confidence intervals
    "one_sample_ttest" = list(
      data = c(98.2, 101.5, 99.8, 100.3, 102.1, 97.9, 100.7, 99.5, 101.2, 98.8,
               100.4, 99.1, 101.8, 98.6, 100.9, 99.7, 101.4, 98.3, 100.1, 99.9,
               101.6, 98.4, 100.8, 99.3, 101.1, 98.7, 100.5, 99.6, 101.3, 98.9),
      expected_mean = 100,
      true_mean = 100,
      description = "Normal data, n=30, mean=100, sd=1.2",
      test_value = 100,
      alpha = 0.05
    ),
    
    # Two-sample t-tests
    "two_sample_ttest" = list(
      group1 = ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 1.0],
      group2 = ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 1.0],
      group1_name = "Vitamin C",
      group2_name = "Orange Juice",
      description = "ToothGrowth data: Vitamin C vs Orange Juice at 1.0mg dose",
      test_type = "two_sided",
      alpha = 0.05
    ),
    
    # Paired t-tests
    "paired_ttest" = list(
      before = sleep$extra[sleep$group == 1],
      after = sleep$extra[sleep$group == 2],
      group1_name = "Drug 1",
      group2_name = "Drug 2", 
      description = "Sleep study: paired measurements of sleep increase",
      test_type = "two_sided",
      alpha = 0.05
    ),
    
    # Confidence intervals for proportions
    "ci_proportion" = list(
      successes = 65,
      total = 100,
      proportion = 0.65,
      description = "65 successes out of 100 trials",
      confidence_level = 0.95
    ),
    
    # Contingency table analysis (2x2)
    "contingency_2x2" = list(
      data = matrix(c(12, 8, 15, 25), nrow = 2,
                   dimnames = list(c("Treatment", "Control"), 
                                 c("Success", "Failure"))),
      description = "2x2 contingency table: Treatment vs Control",
      test_type = "chi_square"
    ),
    
    # Contingency table analysis (larger)
    "contingency_larger" = list(
      data = as.table(margin.table(Titanic, c(1,4))), # Class vs Survived
      description = "Titanic survival by passenger class",
      test_type = "chi_square"
    ),
    
    # McNemar's test (matched pairs)
    "mcnemars" = list(
      data = matrix(c(25, 10, 5, 40), nrow = 2,
                   dimnames = list(c("Before_Yes", "Before_No"),
                                 c("After_Yes", "After_No"))),
      description = "McNemar test: Before/After treatment responses",
      test_type = "mcnemars"
    ),
    
    # Run chart data
    "run_chart" = list(
      values = c(23.5, 24.1, 22.8, 25.2, 23.9, 24.7, 23.3, 24.8, 22.9, 25.1,
                23.7, 24.2, 23.1, 25.0, 24.3, 23.6, 24.9, 23.2, 25.3, 24.0,
                23.8, 24.4, 23.0, 25.4, 24.1, 23.5, 24.6, 23.4, 25.2, 23.9),
      time_points = 1:30,
      center_line = 24.0,
      description = "Quality control measurements over time",
      target = 24.0
    ),
    
    # Wilcoxon signed-rank test
    "wilcoxon_paired" = list(
      before = c(6.2, 7.1, 5.8, 6.9, 7.3, 6.0, 7.5, 6.4, 7.0, 6.7),
      after = c(6.8, 7.9, 6.1, 7.8, 8.2, 6.5, 8.1, 7.0, 7.6, 7.3),
      description = "Non-parametric paired comparison",
      test_type = "two_sided"
    ),
    
    # Wilcoxon rank-sum test (Mann-Whitney U)
    "wilcoxon_two_sample" = list(
      group1 = c(12, 15, 13, 18, 16, 14, 17, 13, 15, 16),
      group2 = c(20, 22, 19, 25, 23, 21, 24, 20, 22, 23),
      group1_name = "Group A",
      group2_name = "Group B",
      description = "Non-parametric two-sample comparison",
      test_type = "two_sided"
    ),
    
    # Power analysis data
    "power_analysis" = list(
      effect_size = 0.5,
      alpha = 0.05,
      power = 0.8,
      sample_sizes = c(10, 15, 20, 25, 30, 35, 40, 45, 50),
      description = "Power analysis for medium effect size",
      test_type = "two_sample_ttest"
    ),
    
    # Descriptive statistics
    "descriptive_stats" = list(
      data = mtcars$mpg,
      group = mtcars$cyl,
      variable_name = "Miles per Gallon",
      group_name = "Cylinders",
      description = "Car fuel efficiency by number of cylinders"
    ),
    
    # Missing data scenario
    "missing_data" = list(
      data = c(25.3, NA, 24.7, 26.1, NA, 25.8, 24.9, NA, 25.5, 24.2,
              26.0, 25.1, NA, 24.8, 25.9, NA, 25.4, 24.6, 25.7, NA),
      description = "Data with missing values for robustness testing"
    ),
    
    # Edge cases
    "single_value" = list(
      data = 42,
      description = "Single data point for edge case testing"
    ),
    
    "identical_values" = list(
      data = rep(10, 20),
      description = "All identical values for variance testing"
    ),
    
    "extreme_values" = list(
      data = c(1, 1000000, 2, 3, 4, 5, 1000001, 6, 7, 8),
      description = "Data with extreme outliers"
    ),
    
    # Default case
    stop("Unknown test_type: ", test_type, ". Available types: one_sample_ttest, two_sample_ttest, paired_ttest, ci_proportion, contingency_2x2, contingency_larger, mcnemars, run_chart, wilcoxon_paired, wilcoxon_two_sample, power_analysis, descriptive_stats, missing_data, single_value, identical_values, extreme_values")
  )
}

#' Get Data in Matrix Format for Shiny matrixInput
#' @param test_type Character string specifying the type of analysis  
#' @param group Integer specifying which group (1 or 2) for two-group tests
#' @return Matrix suitable for matrixInput widget
get_matrix_data <- function(test_type, group = 1) {
  data_list <- get_test_data(test_type)
  
  if (test_type %in% c("two_sample_ttest", "wilcoxon_two_sample")) {
    if (group == 1) {
      values <- data_list$group1
    } else {
      values <- data_list$group2
    }
  } else if (test_type == "paired_ttest") {
    if (group == 1) {
      values <- data_list$before
    } else {
      values <- data_list$after
    }
  } else {
    values <- data_list$data
  }
  
  # Convert to column matrix
  matrix(values, ncol = 1, dimnames = list(NULL, "Value"))
}

#' Get Data in Paste Format for textAreaInput
#' @param test_type Character string specifying the type of analysis
#' @param group Integer specifying which group (1 or 2) for two-group tests
#' @return Character string with values separated by newlines
get_paste_data <- function(test_type, group = 1) {
  matrix_data <- get_matrix_data(test_type, group)
  paste(matrix_data[,1], collapse = "\n")
}

#' Create Excel File for Upload Testing
#' @param test_type Character string specifying the type of analysis
#' @param filepath Character string specifying where to save the Excel file
create_excel_test_file <- function(test_type, filepath) {
  data_list <- get_test_data(test_type)
  
  if (test_type %in% c("two_sample_ttest", "wilcoxon_two_sample")) {
    df <- data.frame(
      Group1 = c(data_list$group1, rep(NA, max(0, length(data_list$group2) - length(data_list$group1)))),
      Group2 = c(data_list$group2, rep(NA, max(0, length(data_list$group1) - length(data_list$group2))))
    )
    names(df) <- c(data_list$group1_name, data_list$group2_name)
  } else if (test_type == "paired_ttest") {
    df <- data.frame(
      Before = data_list$before,
      After = data_list$after
    )
    names(df) <- c(data_list$group1_name, data_list$group2_name)
  } else if (test_type == "contingency_2x2") {
    df <- as.data.frame.matrix(data_list$data)
  } else {
    df <- data.frame(Value = data_list$data)
  }
  
  openxlsx::write.xlsx(df, filepath, overwrite = TRUE)
  return(filepath)
}

#' List All Available Test Types
#' @return Character vector of available test types
list_test_types <- function() {
  c("one_sample_ttest", "two_sample_ttest", "paired_ttest", "ci_proportion",
    "contingency_2x2", "contingency_larger", "mcnemars", "run_chart", 
    "wilcoxon_paired", "wilcoxon_two_sample", "power_analysis", 
    "descriptive_stats", "missing_data", "single_value", "identical_values", 
    "extreme_values")
}