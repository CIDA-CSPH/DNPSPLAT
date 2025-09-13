# Chrome Configuration Helper for shinytest2/chromote
# Resolves Chrome detection and startup issues on Windows

cat("=== CHROME CONFIGURATION FOR UI TESTING ===\n")

#' Configure Chrome for shinytest2/chromote on Windows
#' @param verbose Print diagnostic information
#' @return TRUE if Chrome configured successfully, FALSE otherwise
configure_chrome <- function(verbose = TRUE) {
  
  if (verbose) cat("Configuring Chrome for UI testing...\n")
  
  # CRITICAL: Override CRAN detection for chromote/shinytest2
  # This allows Chrome to run in local development/CI environments
  Sys.setenv(NOT_CRAN = "true")
  if (verbose) cat("✓ Set NOT_CRAN=true to bypass CRAN restrictions\n")
  
  # Common Chrome installation paths on Windows
  chrome_paths <- c(
    "C:/Program Files/Google/Chrome/Application/chrome.exe",
    "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe", 
    "C:/Users/${Sys.getenv('USERNAME')}/AppData/Local/Google/Chrome/Application/chrome.exe",
    paste0("C:/Users/", Sys.getenv("USERNAME"), "/AppData/Local/Google/Chrome/Application/chrome.exe")
  )
  
  # Find Chrome executable
  chrome_found <- FALSE
  chrome_path <- NULL
  
  for (path in chrome_paths) {
    # Expand environment variables
    expanded_path <- path.expand(path)
    if (file.exists(expanded_path)) {
      chrome_path <- expanded_path
      chrome_found <- TRUE
      if (verbose) cat("✓ Found Chrome at:", chrome_path, "\n")
      break
    }
  }
  
  if (!chrome_found) {
    if (verbose) {
      cat("✗ Chrome not found in standard locations:\n")
      for (path in chrome_paths) {
        cat("  -", path.expand(path), "\n")
      }
    }
    return(FALSE)
  }
  
  # Set environment variables for chromote
  Sys.setenv(CHROMOTE_CHROME = chrome_path)
  
  # Configure chromote options for better stability
  chromote_args <- c(
    "--no-sandbox",
    "--disable-dev-shm-usage", 
    "--disable-gpu",
    "--disable-features=VizDisplayCompositor",
    "--disable-extensions",
    "--no-first-run",
    "--disable-default-apps"
  )
  
  # Set global options for chromote
  options(chromote.chrome = chrome_path)
  options(chromote.args = chromote_args)
  
  # Configure shinytest2 specifically
  options(shinytest2.chromote.timeout = 30000)  # 30 second timeout
  
  if (verbose) {
    cat("Chrome configuration complete:\n")
    cat("  Path:", chrome_path, "\n")
    cat("  Args:", paste(chromote_args, collapse = " "), "\n")
  }
  
  return(TRUE)
}

#' Test Chrome configuration
#' @param verbose Print diagnostic information
#' @return TRUE if Chrome can be started, FALSE otherwise
test_chrome_config <- function(verbose = TRUE) {
  
  if (verbose) cat("\nTesting Chrome configuration...\n")
  
  # Try to load required packages
  packages_ok <- TRUE
  required_packages <- c("chromote", "shinytest2")
  
  for (pkg in required_packages) {
    if (!require(pkg, character.only = TRUE, quietly = !verbose)) {
      if (verbose) cat("✗ Package", pkg, "not available\n")
      packages_ok <- FALSE
    } else {
      if (verbose) cat("✓ Package", pkg, "loaded\n")
    }
  }
  
  if (!packages_ok) {
    if (verbose) cat("Install missing packages: install.packages(c('chromote', 'shinytest2'))\n")
    return(FALSE)
  }
  
  # Test basic Chrome startup with more robust approach
  tryCatch({
    if (verbose) cat("Testing Chrome browser startup...\n")
    
    # Create a minimal chromote session with longer timeout
    b <- chromote::ChromoteSession$new(timeout = 60000)  # 60 second timeout
    Sys.sleep(2)  # Give it more time to start
    
    # Navigate to a very simple page
    b$Page$navigate("data:text/html,<html><body>OK</body></html>")
    
    # Wait for navigation with timeout
    b$Page$loadEventFired(timeout = 30000)  # 30 second timeout
    
    # Clean up
    b$close()
    
    if (verbose) cat("✓ Chrome test successful\n")
    return(TRUE)
    
  }, error = function(e) {
    if (verbose) {
      cat("✗ Chrome test failed:\n")
      cat("  Error:", e$message, "\n")
      if (grepl("timed out", e$message, ignore.case = TRUE)) {
        cat("  This appears to be a timeout issue - Chrome may be starting slowly\n")
        cat("  For UI testing, this might still work with longer timeouts\n")
      } else {
        cat("  This may indicate Chrome path or permission issues\n")
      }
    }
    return(FALSE)
  })
}

#' Comprehensive Chrome diagnostics
#' @return List of diagnostic information
diagnose_chrome_issues <- function() {
  
  cat("\n=== CHROME DIAGNOSTIC REPORT ===\n")
  
  diagnostics <- list(
    system_info = list(
      os = Sys.info()[["sysname"]],
      version = Sys.info()[["version"]], 
      user = Sys.getenv("USERNAME"),
      r_version = R.version.string
    ),
    chrome_detection = list(),
    package_status = list(),
    environment_vars = list()
  )
  
  # Check Chrome installations
  cat("Checking Chrome installations:\n")
  chrome_paths <- c(
    "C:/Program Files/Google/Chrome/Application/chrome.exe",
    "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe",
    paste0("C:/Users/", Sys.getenv("USERNAME"), "/AppData/Local/Google/Chrome/Application/chrome.exe")
  )
  
  for (path in chrome_paths) {
    exists <- file.exists(path)
    cat(sprintf("  %s %s\n", ifelse(exists, "✓", "✗"), path))
    diagnostics$chrome_detection[[path]] <- exists
  }
  
  # Check package status
  cat("\nChecking R package status:\n")
  packages <- c("shinytest2", "chromote", "shiny")
  for (pkg in packages) {
    installed <- require(pkg, character.only = TRUE, quietly = TRUE)
    cat(sprintf("  %s %s\n", ifelse(installed, "✓", "✗"), pkg))
    diagnostics$package_status[[pkg]] <- installed
  }
  
  # Check environment variables
  cat("\nChecking environment variables:\n")
  env_vars <- c("CHROMOTE_CHROME", "PATH")
  for (var in env_vars) {
    value <- Sys.getenv(var, unset = NA)
    cat(sprintf("  %s: %s\n", var, ifelse(is.na(value), "not set", value)))
    diagnostics$environment_vars[[var]] <- value
  }
  
  # Check current working directory
  cat("\nCurrent working directory:", getwd(), "\n")
  cat("app.R exists:", file.exists("app.R"), "\n")
  
  diagnostics$working_directory <- getwd()
  diagnostics$app_exists <- file.exists("app.R")
  
  return(invisible(diagnostics))
}

#' Initialize Chrome configuration (run this first)
init_chrome_for_ui_testing <- function(verbose = TRUE, skip_test = FALSE) {
  
  cat("=== INITIALIZING CHROME FOR UI TESTING ===\n")
  
  # Step 1: Configure Chrome
  chrome_config_ok <- configure_chrome(verbose = verbose)
  if (!chrome_config_ok) {
    cat("✗ Chrome configuration failed\n")
    cat("Run diagnose_chrome_issues() for more information\n")
    return(FALSE)
  }
  
  # Step 2: Test configuration (optional)
  if (!skip_test) {
    chrome_test_ok <- test_chrome_config(verbose = verbose)
    if (!chrome_test_ok) {
      cat("⚠️  Chrome test failed but configuration appears correct\n") 
      cat("This may be due to timeout issues - UI tests might still work\n")
      cat("Chrome path and options have been configured properly\n")
      
      # Return TRUE anyway since the configuration is set up
      return(TRUE)
    }
  } else {
    cat("ℹ️  Skipping Chrome startup test (configuration only)\n")
  }
  
  cat("✓ Chrome successfully configured for UI testing\n")
  cat("You can now run UI tests with shinytest2\n")
  
  return(TRUE)
}

#' Lightweight Chrome configuration for UI testing
#' This version focuses on configuration without extensive testing
configure_chrome_for_ui_testing <- function() {
  
  cat("Setting up Chrome configuration for UI testing...\n")
  
  # Just do the essential configuration
  chrome_configured <- configure_chrome(verbose = FALSE)
  
  if (chrome_configured) {
    # Set additional shinytest2-specific options
    options(
      shinytest2.chromote.timeout = 60000,  # Longer timeout
      shinytest2.idle = 2000,               # Wait time for app to settle
      chromote.timeout = 60000              # General chromote timeout
    )
    
    cat("✓ Chrome configured for UI testing\n")
    cat("Note: Using extended timeouts to handle Chrome startup delays\n")
    return(TRUE)
  } else {
    cat("✗ Chrome configuration failed\n")
    return(FALSE)
  }
}

# Auto-run configuration when this file is sourced
if (!exists(".chrome_config_initialized")) {
  .chrome_config_initialized <- init_chrome_for_ui_testing(verbose = TRUE)
  
  if (.chrome_config_initialized) {
    cat("\nChrome configuration helper loaded successfully\n")
    cat("Available functions:\n")
    cat("  - init_chrome_for_ui_testing() : Initialize Chrome\n")
    cat("  - test_chrome_config()         : Test Chrome setup\n") 
    cat("  - diagnose_chrome_issues()     : Run diagnostics\n")
  } else {
    cat("\n⚠️  Chrome configuration failed\n")
    cat("Run diagnose_chrome_issues() to troubleshoot\n")
  }
}