# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
DNPSPLAT is a Shiny web application designed for statistical education, specifically targeting DNP (Doctor of Nursing Practice) students. It provides interactive statistical learning modules, data analysis tools, and educational content for statistical literacy.

## Key Technologies
- **R Shiny**: Primary web framework for the interactive application
- **R 4.2.2+**: Core language (R.exe and Rscript.exe located in `C:\Program Files\R\R-4.4.3\bin`)
- **Key Dependencies**: shiny, shinyjs, DT, ggplot2, dplyr, openxlsx, shinymanager, boot, GenBinomApps

## Application Structure
- **`app.R`**: Main application entry point containing UI and server logic (141KB, ~4100 lines)
- **`R/`**: Modular UI components (57 R files) - each file typically contains a specific module's UI functions
  - Naming pattern: `[module]UI.R` (e.g., `homeUI.R`, `cltUI.R`, `ttestsUI.R`)
  - Key modules: Home, CLT (Central Limit Theorem), statistical tests, data analysis tools
- **`www/`**: Static assets including videos, images, Excel templates, documentation
- **`manifest.json`**: Package dependency manifest for deployment (356KB) - lists all R package versions

## Running the Application
```r
# Start the application
shiny::runApp()

# Or run directly
Rscript app.R
```

## Architecture Notes
- **Modular Design**: Each statistical concept/tool is implemented as a separate UI module in the `R/` directory
- **Single File Structure**: Unlike typical Shiny apps with separate ui.R/server.R, this uses a single app.R file
- **Educational Focus**: Application includes embedded videos, interactive exercises, and statistical learning materials
- **Data Upload Support**: Users can upload Excel files for analysis through various modules
- **Authentication**: Uses shinymanager for user authentication and session management

## Key UI Modules
- **homeUI.R**: Landing page and navigation
- **clt*UI.R**: Central Limit Theorem demonstrations and exercises
- **ttests*UI.R**: Various t-test implementations and power calculations  
- **dataStepsUI.R**: Data analysis workflow guidance
- **powerUI.R**: Statistical power and sample size calculations
- **descriptive modules**: Various descriptive statistics tools

## Testing Framework
- **Comprehensive Testing Suite**: Located in `tests/` directory with organized subdirectories
- **Resilient Testing**: Crash recovery, session management, and persistent logging
- **Quick Start**: `source("tests/utilities/test_orchestrator.R")` then `run_resilient_test_suite()`
- **Key Testing Files**:
  - `tests/utilities/test_orchestrator.R`: Main testing coordinator with crash recovery
  - `tests/data/toy_datasets.R`: Standardized test datasets for all statistical modules
  - `tests/config/test_config.yml`: Configuration file for testing behavior
  - `tests/README.md`: Complete testing documentation
- **Testing Approach**: Uses preloaded toy datasets (ToothGrowth, sleep, mtcars, etc.) instead of manual data entry
- **Module Coverage**: Tests 11 core modules with multiple input methods (matrix, paste, file upload)
- **Crash Recovery**: Automatic checkpointing allows resuming interrupted test sessions
- **Logging**: Multi-level logging (DEBUG, INFO, WARN, ERROR) with log rotation
- **Reporting**: Generates HTML, text, and CSV reports with comprehensive results

## Recent Bug Fixes and Issues

### McNemar's Test Input Validation (RESOLVED)
**Issue**: Users reported "nonnegative and finite" error when entering 2x2 contingency table data  
**Root Cause**: Users entering marginal totals instead of paired observations, sometimes with negative calculations  
**Solution Applied**:
- **R/mcnemarsUI.R:769-778**: Added comprehensive input validation
  - Validates non-negative values with educational error message
  - Checks for finite numbers and whole number counts
- **R/mcnemarsUI.R:32-61**: Enhanced user instructions with visual guide
  - Added prominent info box explaining paired observations requirement
  - Visual 2×2 matrix format with cell-by-cell explanation
- **R/mcnemarsUI.R:139-147**: Added example explanation next to matrix input
  - Explains what each cell in the default example represents

**Testing**: Validated with `test_mcnemars_fixes.R` - all validation scenarios pass correctly

### UI Testing Infrastructure
**Chrome/shinytest2 Setup**: 
- Created `tests/ui/chrome_config.R` with NOT_CRAN=true environment variable
- Chrome path auto-detection for Windows systems
- **Authentication**: Removed from `app.R` (lines 91-126, 481-485) for easier testing

## Development Notes
- All UI modules follow the pattern: `[name]UI <- function(id) { ns <- NS(id); ... }`
- The app uses `shinyApp(ui = ui, server = server, enableBookmarking = "url")` for state persistence
- Static files in `www/` include educational materials, templates, and multimedia content
- **Testing Strategy**: Use the resilient testing framework to identify broken functionality systematically
- **Production Issues**: App is deployed on shinyapps.io but experiencing failures - use testing suite for diagnosis
- **File Management**: Testing framework includes automated cleanup and archival of test results
- Do not search files in the www folder
- **McNemar's Module**: Now includes robust input validation and enhanced user guidance