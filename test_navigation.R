# Quick navigation test to identify correct selectors
library(shinytest2)

# Load Chrome configuration
source("tests/ui/chrome_config.R")

# Test navigation selectors
cat("=== TESTING NAVIGATION SELECTORS ===\n")

app <- AppDriver$new(
  app_dir = ".",
  name = "Navigation_Test",
  height = 900,
  width = 1400,
  timeout = 30000
)

# Wait for app to load
app$wait_for_idle(duration = 3000)

# Take screenshot of main page
app$get_screenshot("navigation_test_main.png")

# Debug: Find all available tab elements
tab_info <- app$get_js("
  var allLinks = document.querySelectorAll('a');
  var results = [];
  for (var i = 0; i < allLinks.length; i++) {
    var link = allLinks[i];
    if (link.textContent.trim() !== '') {
      results.push({
        text: link.textContent.trim(),
        dataValue: link.getAttribute('data-value') || 'no-data-value',
        id: link.id || 'no-id',
        classes: link.className || 'no-classes',
        href: link.href || 'no-href'
      });
    }
  }
  return results;
")

cat("Available tabs:\n")
for (i in seq_along(tab_info)) {
  tab <- tab_info[[i]]
  cat(sprintf("  %d. Text: '%s', data-value: '%s', id: '%s', classes: '%s'\n", 
              i, tab$text, tab$dataValue, tab$id, tab$classes))
}

# Try clicking on Analyze tab
cat("\nTrying to click Analyze tab...\n")
tryCatch({
  # Method 1: Simple selector
  app$click("a[data-value='Analyze']")
  app$wait_for_idle(duration = 2000)
  app$get_screenshot("navigation_test_analyze.png")
  cat("✓ Successfully clicked Analyze tab\n")
}, error = function(e) {
  cat("✗ Method 1 failed:", e$message, "\n")
  
  # Method 2: Try with visible text
  tryCatch({
    app$click("//a[text()='Analyze']")
    app$wait_for_idle(duration = 2000)
    cat("✓ Successfully clicked Analyze tab via text\n")
  }, error = function(e2) {
    cat("✗ Method 2 also failed:", e2$message, "\n")
  })
})

app$stop()
cat("=== NAVIGATION TEST COMPLETE ===\n")