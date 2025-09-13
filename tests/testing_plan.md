# Comprehensive Testing Plan for DNPSPLAT Shiny Application

**ENHANCED WITH UI TESTING INTEGRATION**

This plan combines statistical validation testing with automated UI interaction testing using shinytest2. The integrated approach provides complete coverage of both backend calculations and frontend user interface functionality.

## 1. Create Local Testing Environment
- Run the app locally using `shiny::runApp()`
- Document any startup errors or missing dependencies
- Test with and without authentication enabled

## 2. Module-by-Module Functional Testing

### A. Core Navigation & Authentication
- Test login/authentication flow
- Verify tab navigation between Home, Learn, Plan, and Analyze sections
- Check session management and timeout behavior

### B. Data Input Methods (Critical - Multiple Failure Points)
Each module has 3 data input methods that need testing:
- **Manual Entry**: Using matrixInput widgets
- **Paste from Excel**: Using textAreaInput
- **File Upload**: Using fileInput for .xlsx files

Test modules:
- CI for Mean (`ciForMeanUI`)
- CI for Proportion (`ciForProportionUI`)
- Two Sample T-Test (`twoSampleTTestUI`)
- Paired T-Test (`pairedTTest2UI`)
- Contingency Tables (`contTable2UI`)
- McNemars Test (`mcnemarsUI`)
- Wilcoxon Tests (`wilcoxon1UI`, `wilcoxon2UI`)
- Run Charts (`runChart2UI`)
- Power Analysis (`ttestPowerUI`)

### C. Statistical Calculations
For each module, verify:
- Calculations execute without errors
- Results display correctly
- Plots generate properly
- Excel export functionality works

### D. Educational Components
- Video playback functionality
- Interactive demonstrations
- Help/FAQ sections
- Learning module navigation

## 3. Error Handling Assessment
- Test with invalid data inputs (non-numeric, missing values)
- Test with empty datasets
- Test file upload with wrong formats
- Check for unhandled exceptions (no try-catch blocks found in main app)

## 4. Testing Checklist Template

```markdown
## Module: [Module Name]
### Data Input
- [ ] Manual entry works
- [ ] Paste from Excel works
- [ ] File upload (.xlsx) works
- [ ] Sample data loads correctly

### Calculations
- [ ] Statistical test executes
- [ ] Results display correctly
- [ ] No console errors

### Output
- [ ] Tables render properly
- [ ] Plots generate correctly
- [ ] Excel download works

### Error Handling
- [ ] Handles empty input gracefully
- [ ] Handles non-numeric data
- [ ] Clear error messages displayed

### Notes:
[Document specific errors or issues]
```

## 5. Toy Dataset Integration

### **Available Test Files**
The testing suite now includes comprehensive toy datasets:

- `tests/toy_datasets.R` - Standardized datasets for all statistical tests
- `tests/automated_tests.R` - Automated testing framework 
- `tests/expected_results.R` - Reference database for result validation
- `tests/test_report_generator.R` - HTML/text report generation

### **Quick Start Testing**
```r
# Load the testing framework
source("tests/toy_datasets.R")
source("tests/automated_tests.R") 
source("tests/expected_results.R")

# Run smoke test (basic functionality)
smoke_results <- run_smoke_test()

# Run complete test suite
test_results <- run_complete_test_suite()

# Generate reports
source("tests/test_report_generator.R")
reports <- generate_all_reports(test_results)
```

### **Available Toy Datasets**
Each dataset includes multiple formats (matrix, paste, Excel file):

- **one_sample_ttest**: Normal data for single-sample t-tests
- **two_sample_ttest**: ToothGrowth data (Vitamin C vs Orange Juice)
- **paired_ttest**: Sleep study data (paired measurements)
- **ci_proportion**: 65/100 successes for proportion confidence intervals
- **contingency_2x2**: Treatment vs Control success/failure
- **mcnemars**: Before/after matched pairs
- **wilcoxon_paired**: Non-parametric paired data
- **wilcoxon_two_sample**: Non-parametric two-group data
- **run_chart**: Quality control time series data
- **descriptive_stats**: mtcars mpg data
- **power_analysis**: Effect size calculations
- **Edge cases**: Missing data, identical values, extreme outliers

### **Testing Each Input Method**
For systematic testing, each module can be tested with:

```r
# Example: Test CI for Mean module with different input methods
test_type <- "one_sample_ttest"

# 1. Matrix input format
matrix_data <- get_matrix_data(test_type)
# Use in matrixInput widget

# 2. Paste format (for textAreaInput)  
paste_data <- get_paste_data(test_type)
# Copy/paste into text area

# 3. Excel file format
create_excel_test_file(test_type, "test_data.xlsx")
# Upload this file via fileInput
```

### **Expected Results Validation**
Each test compares actual calculations against pre-computed expected results:

```r
# Validate statistical calculations
expected <- get_expected_results("two_sample_ttest")
# Expected: t = -3.3653, p = 0.0032, df = 18

calculated <- calculate_expected_results("two_sample_ttest")  
comparison <- compare_with_expected("two_sample_ttest")
```

## 6. Production vs Local Comparison
- Compare behavior on shinyapps.io vs local
- Check for environment-specific issues
- Verify all static resources load (videos, images, templates)

## 7. Priority Areas for Investigation
Based on the code analysis:
1. **File upload functionality** - Most complex, multiple modules affected
2. **Data validation** - No validation found in code
3. **Session/authentication** - May timeout or fail
4. **Static resources** - Large www/ folder may cause loading issues
5. **Package dependencies** - 30+ packages, version conflicts possible

## 8. Documentation Creation
- Document each module's expected behavior
- Create user guide for common workflows
- List all dependencies and versions
- Create troubleshooting guide

## Key Findings from Code Analysis

### Application Structure
- Single monolithic `app.R` file (141KB, ~4100 lines)
- 57 modular UI components in `R/` directory
- Authentication via `shinymanager` package
- Educational focus with embedded multimedia content

### Potential Failure Points
1. **No Error Handling**: No `try`/`tryCatch` blocks found in main application
2. **Complex Data Flow**: Three different data input methods per module
3. **Large Static Assets**: Extensive `www/` folder with videos and documents
4. **Dependency Heavy**: 30+ R packages with potential version conflicts
5. **Session Management**: Authentication and session timeouts

### Critical Modules Requiring Testing
All modules with file upload and data processing capabilities, particularly those with server-side reactive functions that handle user data input and statistical calculations.

## 9. Advantages of Toy Dataset Approach

### **Speed & Consistency** 
- No manual data entry required
- Same data every test run eliminates variables
- Automated testing of all modules in minutes

### **Comprehensive Coverage**
- Tests all three input methods per module
- Validates statistical calculations against known results  
- Includes edge cases and error conditions

### **Regression Detection**
- Quickly identify when changes break existing functionality
- Baseline results for comparison after fixes
- Automated pass/fail determination

### **Documentation & Reporting**
- Generates HTML, text, and CSV reports
- Clear identification of specific failure points
- Actionable recommendations for fixes

This systematic approach transforms manual testing into automated, reliable validation that can quickly identify exactly which functionalities are broken and provide clear evidence for debugging.

---

## 10. INTEGRATED UI TESTING WITH shinytest2

### **Overview**
The testing framework now includes automated UI interaction testing using shinytest2, providing comprehensive coverage of user interface functionality alongside statistical validation.

### **Enhanced Test Architecture**
```
tests/
├── data/                      [EXISTING - Toy datasets]
├── core/                      [EXISTING - Statistical validation]
├── ui/                        [NEW - UI Testing Layer]
│   ├── setup-shinytest2.R     # shinytest2 configuration
│   ├── test-ui-mcnemars.R     # McNemar's specific UI tests
│   └── test-ui-modules.R      # General module UI tests
├── utilities/                 [ENHANCED - Includes UI orchestration]
└── master_test.R              [NEW - Single command runner]
```

### **Quick Start - Integrated Testing**
```r
# Install required packages
install.packages(c("shinytest2", "chromote"))

# Run comprehensive testing (Statistical + UI)
source("tests/master_test.R")

# Or run enhanced test orchestrator directly
source("test_orchestrator.R")
```

### **Two-Layer Testing Approach**

#### **Layer 1: Statistical Validation (Existing)**
- Tests backend calculations using toy datasets
- Validates statistical results against expected values
- Tests all three data input methods (matrix, paste, file upload)
- Generates comprehensive reports

#### **Layer 2: UI Interaction Testing (New)**
- Automated browser testing with real user interactions
- Takes screenshots for visual verification
- Tests navigation, form inputs, and error handling
- Specifically tests the reported McNemar's issue

### **McNemar's Issue Testing**
The framework includes specific automated testing for the reported "nonnegative and finite" error:

```r
# Specific test for the problematic McNemar's data:
# Pre-intervention: Adherence=3, No Adherence=21  
# Post-intervention: Adherence=22, No Adherence=2

# Test matrix in proper McNemar's format:
matrix(c(3, 22, 21, 2), nrow=2, byrow=TRUE)
```

### **Test Execution Options**

#### **Option 1: Master Test Runner (Recommended)**
```bash
Rscript tests/master_test.R
```
- Installs missing packages automatically
- Runs both statistical and UI tests
- Generates HTML summary report
- Takes screenshots of issues

#### **Option 2: Layer-by-Layer Testing**
```r
# Statistical tests only
source("test_orchestrator.R")  # Will skip UI if not available

# UI tests only  
source("tests/ui/setup-shinytest2.R")
ui_results <- run_ui_tests(headless = TRUE)
```

#### **Option 3: Specific Issue Testing**
```r
# Test McNemar's issue specifically
source("tests/ui/test-ui-mcnemars.R") 
result <- test_mcnemars_ui(headless = FALSE)  # Opens browser to watch
```

### **Enhanced Results and Reporting**

#### **Comprehensive Results Structure**
```r
comprehensive_results <- list(
  statistical = list(...),   # Backend calculation results
  ui = list(...),            # Frontend interaction results  
  mcnemars_specific = list(...), # Specific issue test results
  summary = list(
    statistical = list(passed=X, failed=Y, total=Z),
    ui = list(passed=X, failed=Y, total=Z),
    overall = list(passed=X, failed=Y, total=Z)
  )
)
```

#### **Generated Outputs**
- `comprehensive_test_results.rds` - Complete results
- `test_summary.html` - HTML report with screenshots
- `tests/screenshots/` - UI test screenshots
- Backwards-compatible files for existing scripts

### **Configuration**
Enhanced `tests/config/test_config.yml` includes UI testing settings:
```yaml
ui_testing:
  enabled: true
  headless: true
  screenshots:
    enabled: true 
    on_failure: true
  specific_tests:
    mcnemars:
      test_problematic_data: true
      data_matrix: [[3,22], [21,2]]
```

### **Benefits of Integrated Approach**

1. **Complete Coverage**: Tests both calculations AND user interface
2. **Real User Simulation**: Actual browser interactions, not just API calls  
3. **Visual Evidence**: Screenshots prove what users actually see
4. **Specific Issue Testing**: Direct reproduction of reported problems
5. **Single Command**: Run everything with one script
6. **Backward Compatible**: Existing statistical tests unchanged
7. **Production-Ready**: Same tests work locally and in CI/CD

### **Troubleshooting UI Tests**

If UI tests fail:
1. **Check Chrome**: Ensure Chrome/Chromium is installed
2. **Run Headless**: Set `headless = TRUE` for server environments  
3. **Check App Startup**: Verify `shiny::runApp()` works manually
4. **Screenshots**: Check `tests/screenshots/` for visual debugging
5. **Fall Back**: Statistical tests still run if UI tests fail

### **Example Workflow**
```r
# 1. Run comprehensive tests
source("tests/master_test.R")

# 2. Check results  
results <- readRDS("comprehensive_test_results.rds")

# 3. View HTML report
browseURL("test_summary.html") 

# 4. Check screenshots if issues found
list.files("tests/screenshots", recursive=TRUE)

# 5. Reproduce specific issues manually
if (results$mcnemars_specific$summary$specific_issue_reproduced) {
  cat("McNemar's issue confirmed - check screenshots\n")
}
```

This integrated testing approach provides the most comprehensive validation possible, catching both statistical calculation errors and user interface problems in a single automated run.