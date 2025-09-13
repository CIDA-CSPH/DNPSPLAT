# DNPSPLAT UI Testing with shinytest2

This directory contains automated UI testing functionality using shinytest2 for comprehensive browser-based testing of the DNPSPLAT Shiny application.

## Quick Start

### 1. Install Requirements
```r
install.packages(c("shinytest2", "chromote"))
```

### 2. Run All Tests
```r
# From project root directory
source("tests/master_test.R")
```

### 3. View Results
- Check console output for summary
- Open `test_summary.html` for detailed report
- Browse `tests/screenshots/` for visual evidence

## Files in this Directory

### `setup-shinytest2.R`
- Main configuration and setup for shinytest2
- Contains `run_ui_tests()` function for general UI testing
- Integrates with existing toy datasets from the statistical testing framework

### `test-ui-mcnemars.R` 
- Specific test for McNemar's module issue
- Tests the reported "nonnegative and finite" error
- Contains `test_mcnemars_ui()` function
- Takes detailed screenshots of the problem

## Usage Examples

### Basic UI Testing
```r
source("tests/ui/setup-shinytest2.R")

# Test all modules with headless browser
ui_results <- run_ui_tests(headless = TRUE)

# Test specific modules only
ui_results <- run_ui_tests(headless = TRUE, modules = list(
  "mcnemars" = "mcnemars",
  "twoSampleTTest" = "two_sample_ttest"
))
```

### McNemar's Specific Issue Testing
```r
source("tests/ui/test-ui-mcnemars.R")

# Test with browser visible (for debugging)
result <- test_mcnemars_ui(headless = FALSE)

# Check if the specific error was reproduced
if (result$summary$specific_issue_reproduced) {
  cat("The 'nonnegative and finite' error was reproduced!\n")
  # Check screenshots in tests/screenshots/mcnemars/
}
```

### Integration with Statistical Tests
The UI tests automatically use the same toy datasets as the statistical tests:

```r
# These datasets are available to UI tests:
# - "one_sample_ttest" 
# - "two_sample_ttest"
# - "paired_ttest"
# - "ci_proportion" 
# - "contingency_2x2"
# - "mcnemars"
# - "wilcoxon_paired"
# - "wilcoxon_two_sample"
# - "descriptive_stats"
```

## Screenshots

Screenshots are automatically taken during testing and saved to:
- `tests/screenshots/` - General UI test screenshots
- `tests/screenshots/mcnemars/` - McNemar's specific issue screenshots

Screenshot naming convention:
- `{module_name}_loaded.png` - After navigating to module
- `{module_name}_final.png` - After completing tests
- `{module_name}_error.png` - If errors occurred

## Configuration

UI testing behavior can be configured in `tests/config/test_config.yml`:

```yaml
ui_testing:
  enabled: true
  headless: true
  browser: "chrome"
  timeout_ms: 30000
  screenshots:
    enabled: true
    on_failure: true
    on_success: false
```

## Troubleshooting

### Common Issues

1. **Chrome not found**
   - Install Google Chrome or Chromium
   - Ensure it's in your system PATH

2. **App won't start**
   - Test manually: `shiny::runApp()`
   - Check for missing dependencies

3. **Tests timeout**
   - Increase timeout in config: `timeout_ms: 60000`
   - Check app startup time

4. **Navigation fails**
   - Screenshots will show what the browser sees
   - Check module names and tab structure

### Debug Mode
```r
# Run with browser visible to see what's happening
test_mcnemars_ui(headless = FALSE)

# Check detailed results
result <- run_ui_tests(headless = TRUE)
str(result)  # See full result structure
```

## Integration with Existing Framework

This UI testing layer is fully integrated with the existing statistical testing framework:

1. **Uses same toy datasets** - No duplication of test data
2. **Same module names** - Consistent with statistical tests  
3. **Compatible results** - Results merge with statistical test results
4. **Backwards compatible** - Existing tests continue to work unchanged

The enhanced `test_orchestrator.R` automatically runs UI tests if available, or falls back to statistical-only testing if shinytest2 is not installed.