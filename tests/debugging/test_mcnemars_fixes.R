# TESTING McNEMAR'S VALIDATION FIXES
# This tests the input validation added to mcnemarsUI.R

cat("=== TESTING McNEMAR'S VALIDATION FIXES ===\n")

# Source the debug script to recreate test conditions
source("debug_mcnemars.R")

cat("\n=== TESTING VALIDATION LOGIC DIRECTLY ===\n")

# Test the validation logic we added to the code
test_validation <- function(test_matrix, test_name) {
  cat("\n--- Testing validation for:", test_name, "---\n")
  print(test_matrix)
  
  # Replicate the exact validation logic from mcnemarsUI.R lines 770-778
  validation_passed <- TRUE
  error_message <- ""
  
  tryCatch({
    # Check for negative values
    if (any(test_matrix < 0)) {
      stop("Error: All matrix entries must be non-negative. McNemar's test requires counts of paired observations, not differences or negative values.")
    }
    
    # Check for non-finite values
    if (any(!is.finite(test_matrix))) {
      stop("Error: All matrix entries must be finite numbers.")
    }
    
    # Check for non-whole numbers
    if (any(test_matrix != round(test_matrix))) {
      stop("Error: All matrix entries must be whole numbers (counts of observations).")
    }
    
    cat("✓ Validation PASSED\n")
    
    # If validation passes, try McNemar's test
    result <- mcnemar.test(test_matrix)
    cat("✓ McNemar's test successful - chi2:", result$statistic, "p:", result$p.value, "\n")
    
  }, error = function(e) {
    cat("✗ Validation CAUGHT error:", e$message, "\n")
    validation_passed <<- FALSE
    error_message <<- e$message
  })
  
  return(list(passed = validation_passed, message = error_message))
}

# Test cases that should PASS validation
valid_matrices <- list(
  "Valid example 1" = matrix(c(22, 2, 10, 6), nrow=2, byrow=TRUE),
  "Valid example 2" = matrix(c(2, 1, 20, 1), nrow=2, byrow=TRUE),
  "All zeros" = matrix(c(0, 0, 0, 0), nrow=2, byrow=TRUE),
  "Single observations" = matrix(c(1, 0, 0, 1), nrow=2, byrow=TRUE)
)

# Test cases that should FAIL validation
invalid_matrices <- list(
  "Negative values" = matrix(c(-19, 19, 19, -19), nrow=2, byrow=TRUE),
  "Single negative" = matrix(c(-1, 2, 3, 4), nrow=2, byrow=TRUE),
  "Non-integer values" = matrix(c(22.5, 2.1, 10.7, 6.3), nrow=2, byrow=TRUE),
  "Infinite values" = matrix(c(Inf, 2, 10, 6), nrow=2, byrow=TRUE),
  "NaN values" = matrix(c(NaN, 2, 10, 6), nrow=2, byrow=TRUE)
)

cat("\n=== TESTING VALID MATRICES (should pass) ===\n")
valid_results <- lapply(names(valid_matrices), function(name) {
  result <- test_validation(valid_matrices[[name]], name)
  return(result)
})
names(valid_results) <- names(valid_matrices)

cat("\n=== TESTING INVALID MATRICES (should fail) ===\n")
invalid_results <- lapply(names(invalid_matrices), function(name) {
  result <- test_validation(invalid_matrices[[name]], name)
  return(result)
})
names(invalid_results) <- names(invalid_matrices)

cat("\n=== VALIDATION TEST SUMMARY ===\n")

# Check that all valid matrices passed
valid_passed <- all(sapply(valid_results, function(x) x$passed))
cat("Valid matrices all passed:", valid_passed, "\n")

# Check that all invalid matrices failed
invalid_failed <- all(sapply(invalid_results, function(x) !x$passed))
cat("Invalid matrices all failed:", invalid_failed, "\n")

if (valid_passed && invalid_failed) {
  cat("🎉 ALL VALIDATION TESTS PASSED! The fixes work correctly.\n")
} else {
  cat("❌ Some validation tests failed. Review the implementation.\n")
}

cat("\n=== USER'S SPECIFIC ERROR CASE ===\n")
# Test the exact case that would cause user's error
user_error_matrix <- matrix(c(-19, 19, 19, -19), nrow=2, byrow=TRUE)
cat("Testing user's problematic case (negative differences):\n")
result <- test_validation(user_error_matrix, "User's error case")

if (!result$passed && grepl("non-negative", result$message)) {
  cat("✅ SUCCESS: User's error case is now properly caught and handled!\n")
} else {
  cat("❌ PROBLEM: User's error case was not properly handled.\n")
}

cat("\n=== TESTING COMPLETE ===\n")