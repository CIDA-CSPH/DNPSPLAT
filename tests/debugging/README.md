# Debugging Scripts for DNPSPLAT Issues

This directory contains debugging and analysis scripts created during issue investigation and resolution.

## McNemar's Test Issue Investigation (September 2025)

### Files Created During McNemar's Bug Fix Session:

1. **`debug_mcnemars.R`**
   - Initial error reproduction script
   - Tests various matrix input formats that could cause "nonnegative and finite" error
   - Successfully identified that negative values trigger the user's reported error

2. **`test_transformation_logic.R`**  
   - Analysis of data transformation logic in mcnemarsUI.R lines 815-820
   - Tests whether user's marginal totals could produce negative values
   - Identifies root cause: users entering marginal totals instead of paired observations

3. **`test_mcnemars_fixes.R`**
   - Comprehensive validation testing for the implemented fixes
   - Tests both valid and invalid matrix inputs
   - Validates that all validation scenarios work correctly
   - Confirms user's error case is properly caught and handled

### Issue Summary:
- **Problem**: Users getting "nonnegative and finite" error in McNemar's test
- **Root Cause**: Users entering marginal totals instead of paired observations, sometimes calculating differences that result in negative values
- **Solution**: Added input validation and enhanced user guidance in `R/mcnemarsUI.R`
- **Status**: RESOLVED ✅

### Usage:
These scripts can be run independently to reproduce the original issue and verify that fixes are working:

```r
# Reproduce original error
source("tests/debugging/debug_mcnemars.R")

# Analyze transformation logic
source("tests/debugging/test_transformation_logic.R")

# Validate fixes
source("tests/debugging/test_mcnemars_fixes.R")
```

### Future Reference:
Keep these scripts for:
- Testing regression of the McNemar's fix
- Understanding the investigation methodology
- Reference for similar statistical module debugging
- Training material for debugging complex user input issues

## General Debugging Guidelines

1. **Create comprehensive reproduction scripts** before fixing issues
2. **Test all edge cases** that could cause similar problems  
3. **Validate fixes thoroughly** with both positive and negative test cases
4. **Document root causes** for future reference and team knowledge
5. **Archive debugging scripts** for regression testing and knowledge transfer