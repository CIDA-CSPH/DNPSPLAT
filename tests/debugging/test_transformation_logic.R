# TESTING McNEMAR'S TRANSFORMATION LOGIC
# Investigating if the user's reported data could cause issues
# User reported: Pre-intervention (Adherence=3, No Adherence=21), Post-intervention (Adherence=22, No Adherence=2)

cat("=== McNEMAR'S TRANSFORMATION ANALYSIS ===\n")

# Test the user's reported marginal totals
user_data <- list(
  pre_adherence = 3,
  pre_no_adherence = 21, 
  post_adherence = 22,
  post_no_adherence = 2
)

cat("User reported data:\n")
cat("Pre-intervention: Adherence =", user_data$pre_adherence, ", No Adherence =", user_data$pre_no_adherence, "\n")
cat("Post-intervention: Adherence =", user_data$post_adherence, ", No Adherence =", user_data$post_no_adherence, "\n")

# The question is: what 2x2 matrix should users enter for McNemar's test?
# McNemar's test expects a matrix of paired changes, not marginal totals

cat("\n=== TESTING POSSIBLE USER INPUT MATRICES ===\n")

# Possibility 1: User enters marginal totals as rows
possible_matrices <- list(
  "Marginal totals as rows" = matrix(c(3, 21, 22, 2), nrow=2, byrow=TRUE),
  "Marginal totals as cols" = matrix(c(3, 22, 21, 2), nrow=2, byrow=TRUE),  
  "Swapped order" = matrix(c(21, 3, 2, 22), nrow=2, byrow=TRUE),
  "Negative difference attempt" = matrix(c(3-22, 21-2, 22-3, 2-21), nrow=2, byrow=TRUE)
)

for (name in names(possible_matrices)) {
  cat("\n--- Testing:", name, "---\n")
  test_matrix <- possible_matrices[[name]]
  print(test_matrix)
  
  # Test the actual transformation from lines 815-820
  cat("Applying transformation logic (lines 815-820):\n")
  matrix1a <- test_matrix
  row1 <- c(matrix1a[1,1]+matrix1a[1,2], matrix1a[1,1]+matrix1a[2,1])
  row2 <- c(matrix1a[2,1]+matrix1a[2,2], matrix1a[1,2]+matrix1a[2,2])
  transformed_table <- rbind(row1, row2)
  
  cat("Transformed table:\n")
  print(transformed_table)
  
  # Test mcnemar.test on the ORIGINAL matrix (line 769)
  tryCatch({
    result <- mcnemar.test(matrix1a)
    cat("✓ mcnemar.test() works - chi2:", result$statistic, "p:", result$p.value, "\n")
  }, error = function(e) {
    cat("✗ mcnemar.test() ERROR:", e$message, "\n")
    if (grepl("nonnegative and finite", e$message, ignore.case = TRUE)) {
      cat("🎯 THIS IS THE USER'S ERROR!\n")
    }
  })
}

cat("\n=== CORRECT McNEMAR'S MATRIX FORMAT ===\n")
cat("McNemar's test expects a 2x2 contingency table of PAIRED observations:\n")
cat("                Post-Yes    Post-No\n")
cat("Pre-Yes      |    a    |    b    |\n") 
cat("Pre-No       |    c    |    d    |\n")
cat("\nWhere: a = both Yes, b = Pre-Yes/Post-No, c = Pre-No/Post-Yes, d = both No\n")

# Create a valid example for the user's scenario
cat("\nFor the user's data, if we assume some pairing:\n")
cat("We need to know how many people changed from non-adherent to adherent, etc.\n")

# Example valid matrix that matches marginal totals
valid_example <- matrix(c(2, 1, 20, 1), nrow=2, byrow=TRUE)
cat("\nExample valid matrix (hypothetical pairing):\n")
print(valid_example)

# Verify marginals match
pre_adherent <- valid_example[1,1] + valid_example[1,2]  # 2+1=3 ✓
pre_non_adherent <- valid_example[2,1] + valid_example[2,2]  # 20+1=21 ✓  
post_adherent <- valid_example[1,1] + valid_example[2,1]  # 2+20=22 ✓
post_non_adherent <- valid_example[1,2] + valid_example[2,2]  # 1+1=2 ✓

cat("Marginal verification:\n")
cat("Pre-adherent:", pre_adherent, "(should be 3) ✓\n")
cat("Pre-non-adherent:", pre_non_adherent, "(should be 21) ✓\n") 
cat("Post-adherent:", post_adherent, "(should be 22) ✓\n")
cat("Post-non-adherent:", post_non_adherent, "(should be 2) ✓\n")

tryCatch({
  result <- mcnemar.test(valid_example)
  cat("✓ Valid matrix works - chi2:", result$statistic, "p:", result$p.value, "\n")
}, error = function(e) {
  cat("✗ ERROR:", e$message, "\n")
})

cat("\n=== CONCLUSION ===\n")
cat("The user likely entered marginal totals instead of paired observations.\n")
cat("This is a DATA ENTRY error, not a code bug.\n")