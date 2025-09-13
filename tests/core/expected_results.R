# Expected Results Reference Database for DNPSPLAT Testing
# This file contains pre-calculated expected results for validation of statistical calculations

#' Get Expected Results for Statistical Tests
#' @param test_type Character string specifying the type of analysis
#' @return List with expected statistical results
get_expected_results <- function(test_type) {
  
  # Pre-calculated expected results for validation
  expected_results_db <- list(
    
    # One-sample t-test results
    # Data: mean ≈ 100, n=30, testing H0: μ = 100
    "one_sample_ttest" = list(
      description = "One-sample t-test against μ = 100",
      t_statistic = 0.0,  # Approximately 0 since true mean ≈ 100
      p_value = 1.0,      # Approximately 1 since H0 is true
      df = 29,            # n-1 = 30-1 = 29
      ci_lower = 99.55,   # Approximate 95% CI lower bound
      ci_upper = 100.45,  # Approximate 95% CI upper bound
      mean = 100.0,       # Sample mean ≈ 100
      tolerance = 0.5     # Allow larger tolerance due to random data
    ),
    
    # Two-sample t-test results  
    # ToothGrowth data: VC vs OJ at 1.0mg dose
    "two_sample_ttest" = list(
      description = "Two-sample t-test: ToothGrowth VC vs OJ",
      t_statistic = -3.3653,  # From ToothGrowth analysis
      p_value = 0.0032,       # Significant difference
      df = 18,                # Degrees of freedom
      ci_lower = -9.057,      # 95% CI for mean difference
      ci_upper = -1.777,      # 95% CI for mean difference
      mean_diff = -5.417,     # Mean difference (VC - OJ)
      tolerance = 0.1
    ),
    
    # Paired t-test results
    # Sleep data: drug 1 vs drug 2 effect on sleep
    "paired_ttest" = list(
      description = "Paired t-test: Sleep study drug comparison",
      t_statistic = -4.0621,  # From sleep dataset analysis
      p_value = 0.0028,       # Significant difference
      df = 9,                 # n-1 pairs
      ci_lower = -2.4598,     # 95% CI for mean difference  
      ci_upper = -0.7402,     # 95% CI for mean difference
      mean_diff = -1.58,      # Mean difference
      tolerance = 0.05
    ),
    
    # Confidence interval for proportion
    # 65 successes out of 100 trials
    "ci_proportion" = list(
      description = "95% CI for proportion: 65/100",
      proportion = 0.65,      # Sample proportion
      ci_lower = 0.549,       # 95% CI lower bound
      ci_upper = 0.744,       # 95% CI upper bound
      x_squared = 9.0,        # Chi-square statistic (test against 0.5)
      p_value = 0.0027,       # P-value for test against 0.5
      tolerance = 0.01
    ),
    
    # Chi-square test for 2x2 contingency table
    # Treatment/Control vs Success/Failure
    "contingency_2x2" = list(
      description = "Chi-square test: 2x2 contingency table",
      chi_squared = 5.0446,   # Chi-square statistic
      p_value = 0.0247,       # P-value (significant)
      df = 1,                 # (rows-1)*(cols-1) = 1*1 = 1
      expected_freq = matrix(c(13.5, 13.5, 13.5, 26.5), nrow=2), # Expected frequencies
      tolerance = 0.01
    ),
    
    # Chi-square test for larger contingency table
    # Titanic survival by class
    "contingency_larger" = list(
      description = "Chi-square test: Titanic survival by class",
      chi_squared = 127.86,   # Large chi-square value
      p_value = 0.0000,       # Highly significant
      df = 3,                 # (4-1)*(2-1) = 3
      tolerance = 1.0         # Larger tolerance for complex data
    ),
    
    # McNemar's test for matched pairs
    # Before/After treatment responses
    "mcnemars" = list(
      description = "McNemar test: Before/after treatment",
      chi_squared = 1.6667,   # McNemar chi-square
      p_value = 0.1967,       # Not significant
      df = 1,                 # Always 1 for McNemar
      tolerance = 0.01
    ),
    
    # Wilcoxon signed-rank test (paired)
    "wilcoxon_paired" = list(
      description = "Wilcoxon signed-rank test: paired samples",
      V_statistic = 55,       # V statistic 
      p_value = 0.0020,       # Significant result
      tolerance = 0.01
    ),
    
    # Wilcoxon rank-sum test (Mann-Whitney U)
    "wilcoxon_two_sample" = list(
      description = "Wilcoxon rank-sum test: two independent samples",  
      W_statistic = 0,        # W statistic (all group1 < group2)
      p_value = 0.0000,       # Highly significant
      tolerance = 0.01
    ),
    
    # Descriptive statistics
    # mtcars mpg data
    "descriptive_stats" = list(
      description = "Descriptive statistics: mtcars mpg",
      mean = 20.091,          # Mean mpg
      median = 19.200,        # Median mpg  
      sd = 6.027,             # Standard deviation
      min = 10.400,           # Minimum value
      max = 33.900,           # Maximum value
      n = 32,                 # Sample size
      tolerance = 0.1
    ),
    
    # Power analysis results
    "power_analysis" = list(
      description = "Power analysis: effect size 0.5, alpha 0.05",
      effect_size = 0.5,      # Medium effect size
      alpha = 0.05,           # Type I error rate
      power_target = 0.8,     # Target power
      n_required = 64,        # Required sample size (total)
      tolerance = 2           # Allow ±2 for sample size
    ),
    
    # Run chart statistics
    "run_chart" = list(
      description = "Run chart: process control statistics",
      mean = 24.0,            # Center line
      runs_above = 15,        # Points above center line
      runs_below = 15,        # Points below center line
      longest_run = 3,        # Longest consecutive run
      tolerance = 1
    )
  )
  
  if (test_type %in% names(expected_results_db)) {
    return(expected_results_db[[test_type]])
  } else {
    warning("No expected results available for test_type: ", test_type)
    return(NULL)
  }
}

#' Calculate Expected Results for Custom Data
#' This function calculates expected results for the toy datasets
#' Use this to generate or verify expected results
#' @param test_type Character string specifying the type of analysis
#' @return List with calculated results from toy data
calculate_expected_results <- function(test_type) {
  
  # Load the toy datasets with path checking
  if (!exists("get_test_data")) {
    if (file.exists("tests/data/toy_datasets.R")) {
      source("tests/data/toy_datasets.R")
    } else if (file.exists("tests/toy_datasets.R")) {
      source("tests/toy_datasets.R")
    } else {
      stop("Cannot find toy_datasets.R to load get_test_data function")
    }
  }
  
  data_list <- get_test_data(test_type)
  results <- list(test_type = test_type, timestamp = Sys.time())
  
  tryCatch({
    if (test_type == "one_sample_ttest") {
      test_result <- t.test(data_list$data, mu = data_list$test_value)
      results <- list(
        t_statistic = as.numeric(test_result$statistic),
        p_value = test_result$p.value,
        df = as.numeric(test_result$parameter),
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean = as.numeric(test_result$estimate)
      )
      
    } else if (test_type == "two_sample_ttest") {
      test_result <- t.test(data_list$group1, data_list$group2)
      results <- list(
        t_statistic = as.numeric(test_result$statistic),
        p_value = test_result$p.value,
        df = as.numeric(test_result$parameter),
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean_diff = as.numeric(diff(test_result$estimate))
      )
      
    } else if (test_type == "paired_ttest") {
      test_result <- t.test(data_list$before, data_list$after, paired = TRUE)
      results <- list(
        t_statistic = as.numeric(test_result$statistic),
        p_value = test_result$p.value,
        df = as.numeric(test_result$parameter),
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        mean_diff = as.numeric(test_result$estimate)
      )
      
    } else if (test_type == "ci_proportion") {
      test_result <- prop.test(data_list$successes, data_list$total)
      results <- list(
        proportion = as.numeric(test_result$estimate),
        ci_lower = test_result$conf.int[1],
        ci_upper = test_result$conf.int[2],
        x_squared = as.numeric(test_result$statistic),
        p_value = test_result$p.value
      )
      
    } else if (test_type %in% c("contingency_2x2", "contingency_larger")) {
      test_result <- chisq.test(data_list$data)
      results <- list(
        chi_squared = as.numeric(test_result$statistic),
        p_value = test_result$p.value,
        df = as.numeric(test_result$parameter),
        expected_freq = test_result$expected
      )
      
    } else if (test_type == "mcnemars") {
      test_result <- mcnemar.test(data_list$data)
      results <- list(
        chi_squared = as.numeric(test_result$statistic),
        p_value = test_result$p.value,
        df = as.numeric(test_result$parameter)
      )
      
    } else if (test_type == "wilcoxon_paired") {
      test_result <- wilcox.test(data_list$before, data_list$after, paired = TRUE)
      results <- list(
        V_statistic = as.numeric(test_result$statistic),
        p_value = test_result$p.value
      )
      
    } else if (test_type == "wilcoxon_two_sample") {
      test_result <- wilcox.test(data_list$group1, data_list$group2)
      results <- list(
        W_statistic = as.numeric(test_result$statistic),
        p_value = test_result$p.value
      )
      
    } else if (test_type == "descriptive_stats") {
      results <- list(
        mean = mean(data_list$data, na.rm = TRUE),
        median = median(data_list$data, na.rm = TRUE),
        sd = sd(data_list$data, na.rm = TRUE),
        min = min(data_list$data, na.rm = TRUE),
        max = max(data_list$data, na.rm = TRUE),
        n = length(data_list$data[!is.na(data_list$data)])
      )
    }
    
    cat("Calculated results for", test_type, ":\n")
    print(results)
    
  }, error = function(e) {
    results$error <- e$message
    cat("Error calculating results for", test_type, ":", e$message, "\n")
  })
  
  return(results)
}

#' Compare Calculated vs Expected Results
#' @param test_type Character string specifying the type of analysis
#' @param tolerance Numeric tolerance for comparisons
#' @return Comparison results
compare_with_expected <- function(test_type, tolerance = 0.01) {
  
  calculated <- calculate_expected_results(test_type)
  expected <- get_expected_results(test_type)
  
  if (is.null(expected)) {
    return(list(status = "no_expected_results"))
  }
  
  comparison <- list(
    test_type = test_type,
    timestamp = Sys.time(),
    matches = list(),
    mismatches = list(),
    overall_match = TRUE
  )
  
  for (param in names(expected)) {
    if (param %in% c("description", "tolerance")) next
    
    if (param %in% names(calculated)) {
      calc_val <- calculated[[param]]
      exp_val <- expected[[param]]
      
      if (is.numeric(calc_val) && is.numeric(exp_val)) {
        tol <- if ("tolerance" %in% names(expected)) expected$tolerance else tolerance
        within_tolerance <- abs(calc_val - exp_val) <= tol
        
        if (within_tolerance) {
          comparison$matches[[param]] <- list(calculated = calc_val, expected = exp_val)
        } else {
          comparison$mismatches[[param]] <- list(
            calculated = calc_val, 
            expected = exp_val,
            difference = abs(calc_val - exp_val),
            tolerance = tol
          )
          comparison$overall_match <- FALSE
        }
      }
    }
  }
  
  cat("Comparison for", test_type, ":\n")
  cat("Overall match:", comparison$overall_match, "\n")
  if (length(comparison$mismatches) > 0) {
    cat("Mismatches found:\n")
    for (param in names(comparison$mismatches)) {
      cat("  ", param, ": calculated =", comparison$mismatches[[param]]$calculated,
          ", expected =", comparison$mismatches[[param]]$expected, "\n")
    }
  }
  
  return(comparison)
}

#' List All Available Expected Results
#' @return Character vector of test types with expected results
list_expected_results <- function() {
  expected_results_db <- list(
    "one_sample_ttest", "two_sample_ttest", "paired_ttest", "ci_proportion",
    "contingency_2x2", "contingency_larger", "mcnemars", "wilcoxon_paired",
    "wilcoxon_two_sample", "descriptive_stats", "power_analysis", "run_chart"
  )
  
  return(unlist(expected_results_db))
}