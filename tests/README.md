# DNPSPLAT Testing Suite

A comprehensive, resilient testing framework for the DNPSPLAT Shiny application with crash recovery, persistent logging, and automated reporting.

## Quick Start

```r
# Load the resilient testing suite
source("tests/utilities/test_orchestrator.R")

# Run complete testing suite with crash recovery
results <- run_resilient_test_suite()

# Check status of any incomplete sessions
check_for_incomplete_sessions()

# Clean start (removes all session data)
clean_start()
```

## Directory Structure

```
tests/
├── config/                    # Configuration management
│   ├── test_config.yml       # Main configuration file
│   └── config_manager.R      # Configuration utilities
├── core/                      # Core testing engine
│   ├── automated_tests.R     # Automated testing framework
│   ├── expected_results.R    # Reference results database
│   ├── test_logger.R         # Multi-level logging system
│   └── test_session_manager.R # Session state & checkpointing
├── data/                      # Test datasets and templates
│   ├── toy_datasets.R        # Standardized test datasets
│   ├── excel_templates/      # Generated Excel files
│   └── custom_datasets/      # User-provided test data
├── utilities/                 # Utility functions
│   ├── test_orchestrator.R   # Main test coordinator
│   ├── test_report_generator.R # HTML/text report generation
│   └── cleanup_manager.R     # File cleanup and archival
├── reports/                   # Generated reports
│   ├── current/              # Latest test runs
│   └── history/              # Archived reports
├── logs/                      # Persistent logging
│   ├── test_sessions.log     # Session-level logs
│   ├── module_details.log    # Detailed module logs
│   ├── errors.log           # Error-only logs
│   └── performance.log      # Performance metrics
├── checkpoints/               # Session state recovery
│   ├── session_state.rds    # Current session state
│   ├── module_progress.json # Module completion status
│   └── recovery_data.rds    # Crash recovery data
└── README.md                 # This file
```

## Key Features

### 🔄 **Crash Recovery**
- Automatic session state checkpointing
- Resume from last completed module
- Emergency result saving
- Recovery data preservation

### 📊 **Persistent Logging** 
- Multi-level logging (DEBUG, INFO, WARN, ERROR)
- Session, module, error, and performance logs
- Log rotation and archival
- JSON structured logging for analysis

### ⚙️ **Configuration Management**
- YAML-based configuration
- Environment-specific settings
- Runtime configuration updates
- Default fallbacks

### 🗂️ **File Organization**
- Automated cleanup of old files
- Report archival and compression
- Disk space monitoring
- Backup management

## Configuration

The testing suite is configured via `tests/config/test_config.yml`:

```yaml
# Example configuration
logging:
  level: "INFO"
  max_log_size_mb: 50

session:
  enable_crash_recovery: true
  auto_save_state: true

modules:
  default_test_list:
    - "ciForMean"
    - "ciForProportion"
    # ... more modules

reporting:
  generate:
    html: true
    text: true
    csv: true
```

## Available Test Datasets

The framework includes standardized datasets for all statistical tests:

| Dataset Type | Description | Use Case |
|-------------|-------------|----------|
| `one_sample_ttest` | Normal data, n=30 | Single-sample t-tests, CI for mean |
| `two_sample_ttest` | ToothGrowth data | Two-sample t-tests |
| `paired_ttest` | Sleep study data | Paired t-tests |
| `ci_proportion` | 65/100 successes | Confidence intervals for proportions |
| `contingency_2x2` | Treatment vs Control | Chi-square tests |
| `mcnemars` | Before/after responses | McNemar's tests |
| `wilcoxon_paired` | Non-parametric paired | Wilcoxon signed-rank |
| `wilcoxon_two_sample` | Non-parametric groups | Mann-Whitney U |
| `run_chart` | Time series data | Run charts and control charts |
| `descriptive_stats` | mtcars mpg data | Descriptive statistics |

## Usage Examples

### Basic Testing
```r
# Load and run tests
source("tests/utilities/test_orchestrator.R")
results <- run_resilient_test_suite()
```

### Custom Module Testing
```r
# Test specific modules
results <- run_resilient_test_suite(modules = c("ciForMean", "twoSampleTTest"))
```

### Configuration Management
```r
# Load configuration utilities
source("tests/config/config_manager.R")

# Print current configuration
print_config_summary()

# Get specific config values
log_level <- get_config("logging.level")
modules <- get_all_modules()
```

### Crash Recovery
```r
# Check for crashed sessions
check_for_incomplete_sessions()

# Run with recovery enabled (default)
results <- run_resilient_test_suite(resume_crashed = TRUE)
```

### File Cleanup
```r
# Load cleanup utilities
source("tests/utilities/cleanup_manager.R")

# Check disk usage
check_disk_space()

# Run automated cleanup
automated_cleanup()

# Dry run to see what would be cleaned
automated_cleanup(dry_run = TRUE)
```

### Manual Testing Components
```r
# Load individual components
source("tests/data/toy_datasets.R")
source("tests/core/automated_tests.R")

# Get test data
data <- get_test_data("two_sample_ttest")
matrix_data <- get_matrix_data("two_sample_ttest")
paste_data <- get_paste_data("two_sample_ttest")

# Create Excel test file
create_excel_test_file("two_sample_ttest", "test_data.xlsx")

# Run smoke test
smoke_results <- run_smoke_test()
```

## Monitoring and Debugging

### Session Status
```r
# Check current session status
get_session_status()

# List available sessions
list_available_sessions()

# Get session summary
get_session_summary()
```

### Log Analysis
```r
# Get log summary
get_log_summary()

# View recent errors (check logs/errors.log)
# View performance metrics (check logs/performance.log)
```

### Report Generation
```r
# Generate comprehensive reports
source("tests/utilities/test_report_generator.R")
reports <- generate_all_reports(results)

# Generate specific report types
generate_html_report(results)
generate_text_report(results) 
generate_csv_summary(results)
```

## Troubleshooting

### Common Issues

1. **"Configuration file not found"**
   - The system will use default configuration
   - Copy `tests/config/test_config.yml` if needed

2. **"Session crashed"**
   - Use `check_for_incomplete_sessions()` to recover
   - Check `tests/logs/errors.log` for details

3. **"No test types defined for module"**
   - Check module names in configuration
   - Verify test mappings in config file

4. **"Disk space warnings"**
   - Run `automated_cleanup()` to free space
   - Check `check_disk_space()` for usage

### Emergency Recovery

If tests crash unexpectedly:

1. Run `check_for_incomplete_sessions()`
2. Choose to resume crashed session
3. Check `tests/checkpoints/recovery_data.rds`
4. Review `tests/logs/errors.log`

### Performance Issues

- Enable performance logging in configuration
- Check `tests/logs/performance.log`
- Monitor memory usage with `check_disk_space()`
- Use cleanup utilities to free space

## Integration with Existing Workflow

The testing suite is designed to integrate with your existing DNPSPLAT testing workflow:

1. **Replace manual testing**: Use standardized datasets instead of manual data entry
2. **Automate validation**: Compare results against expected values automatically  
3. **Persistent results**: All test runs are logged and can be compared over time
4. **Production comparison**: Test locally then compare with production behavior

## UI Testing Infrastructure (Experimental)

**Status**: Partially implemented - requires additional development

### shinytest2 Setup
The framework includes experimental UI testing using shinytest2:
- **Chrome Configuration**: `tests/ui/chrome_config.R` handles Chrome setup
- **CRAN Detection Fix**: Sets `NOT_CRAN=true` to bypass CRAN restrictions
- **Path Auto-Detection**: Automatically finds Chrome installation on Windows

### Known Issues and Workarounds
1. **Chrome Launch Problems**:
   ```r
   source("tests/ui/chrome_config.R")  # Loads proper Chrome configuration
   ```

2. **Authentication Challenges**:
   - UI tests currently blocked by login requirements
   - **Temporary Solution**: Authentication removed from `app.R` for testing
   - **Production Note**: Re-enable auth for deployment

3. **Navigation Selectors**:
   - CSS selectors sometimes fail: `"a[data-value='Analyze']"`
   - XPath more reliable: `"//a[contains(text(), 'Analyze')]"`

### Future UI Testing Goals
- Complete module navigation automation
- Screenshot comparison testing
- Interactive workflow validation
- Form input validation testing

### Current Limitation
UI testing framework is not yet fully functional and requires additional development to reach production readiness.

## Support

For issues or questions:

1. Check the logs in `tests/logs/`
2. Review configuration in `tests/config/`
3. Use diagnostic functions like `get_session_status()`
4. Refer to the original testing plan in `testing_plan.md`
5. For UI testing issues, check `SESSION_NOTES.md` for detailed troubleshooting history