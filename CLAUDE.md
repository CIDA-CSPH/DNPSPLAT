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

## Development Notes
- All UI modules follow the pattern: `[name]UI <- function(id) { ns <- NS(id); ... }`
- The app uses `shinyApp(ui = ui, server = server, enableBookmarking = "url")` for state persistence
- Static files in `www/` include educational materials, templates, and multimedia content
- No traditional testing framework detected - application appears to be manually tested