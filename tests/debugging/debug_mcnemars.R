# DIRECT McNEMAR'S ISSUE REPRODUCTION
# Testing the exact data transformation that causes the "nonnegative and finite" error

cat("=== McNEMAR'S DATA TRANSFORMATION DEBUG ===\n")

# The user's reported data:
# Pre-intervention: Adherence=3, No Adherence=21
# Post-intervention: Adherence=22, No Adherence=2

test_matrices <- list(
  "Format 1 (marginal totals)" = matrix(c(3, 22, 21, 2), nrow=2, byrow=TRUE),
  "Format 2 (reversed)" = matrix(c(3, 21, 22, 2), nrow=2, byrow=TRUE),
  "Format 3 (with negative)" = matrix(c(-3, 21, 22, 2), nrow=2, byrow=TRUE),
  "Format 4 (column order)" = matrix(c(3, 21, 22, 2), nrow=2, byrow=FALSE)
)

# Test each format
for (format_name in names(test_matrices)) {
  cat("\n=== Testing", format_name, "===\n")
  user_matrix <- test_matrices[[format_name]]
  
  print(user_matrix)
  
  # Apply the transformation from mcnemarsUI.R lines 815-820
  matrix1a <- user_matrix
  
  tryCatch({
    # The exact transformation logic from the app:
    row1 <- c(matrix1a[1,1]+matrix1a[1,2], matrix1a[1,1]+matrix1a[2,1])
    row2 <- c(matrix1a[2,1]+matrix1a[2,2], matrix1a[1,2]+matrix1a[2,2])
    transformed_table <- rbind(row1, row2)
    
    cat("Transformed to:\n")
    print(transformed_table)
    
    # Test direct user input
    result1 <- mcnemar.test(user_matrix)
    cat("✓ Direct input works - chi2:", result1$statistic, "p:", result1$p.value, "\n")
    
    # Test the exact call from line 769 of mcnemarsUI.R
    result2 <- mcnemar.test(matrix1a)
    cat("✓ Line 769 call works - chi2:", result2$statistic, "p:", result2$p.value, "\n")
    
  }, error = function(e) {
    cat("✗ ERROR found:", e$message, "\n")
    if (grepl("nonnegative and finite", e$message, ignore.case = TRUE)) {
      cat("🎯 FOUND THE USER'S ERROR!\n")
    }
  })
}

cat("\n=== TESTING SUCCESSFUL TEST CASES ===\n")
# Let me also test what our backend test found worked
backend_matrices <- list(
  "Backend test 1" = matrix(c(3, 21, 22, 2), nrow=2, byrow=TRUE),
  "Backend test 2" = matrix(c(2, 1, 20, 1), nrow=2, byrow=TRUE),
  "Negative test" = matrix(c(-3, 21, 22, 2), nrow=2, byrow=TRUE)
)

for (test_name in names(backend_matrices)) {
  cat("\n", test_name, ":\n")
  test_matrix <- backend_matrices[[test_name]]
  print(test_matrix)
  
  tryCatch({
    result <- mcnemar.test(test_matrix)
    cat("✓ Works - chi2:", result$statistic, "p:", result$p.value, "\n")
  }, error = function(e) {
    cat("✗ ERROR:", e$message, "\n")
    if (grepl("nonnegative and finite", e$message, ignore.case = TRUE)) {
      cat("🎯 This reproduces the user's error!\n")
    }
  })
}

cat("\n=== ANALYSIS COMPLETE ===\n")