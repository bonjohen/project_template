@echo off
setlocal enabledelayedexpansion

echo ===== Project Template Wizard =====

REM Get project name
set /p PROJECT_NAME="Enter project name: "

REM Select template type
echo Select template type:
echo 1. Python
echo 2. JavaScript
echo 3. TypeScript
echo 4. React/Next.js
set /p TEMPLATE_TYPE="Enter selection (1-4): "

REM Configure options based on template type
if "%TEMPLATE_TYPE%"=="1" (
    set TEMPLATE=python
    set /p USE_PYTEST="Use pytest for testing? (y/n): "
    set /p USE_BLACK="Use Black for formatting? (y/n): "
) else if "%TEMPLATE_TYPE%"=="2" (
    set TEMPLATE=javascript
    set /p USE_ESLINT="Use ESLint for linting? (y/n): "
) else if "%TEMPLATE_TYPE%"=="3" (
    set TEMPLATE=typescript
    set /p STRICT_MODE="Use strict TypeScript mode? (y/n): "
) else if "%TEMPLATE_TYPE%"=="4" (
    set TEMPLATE=nextjs
    set /p USE_TAILWIND="Use Tailwind CSS? (y/n): "
)

REM Select license type
echo Select license type:
echo 1. MIT
echo 2. Apache 2.0
echo 3. GPL 3.0
echo 4. None
set /p LICENSE_TYPE="Enter selection (1-4): "

REM Generate project based on selections
echo Generating %PROJECT_NAME% with %TEMPLATE% template...

REM Call appropriate template script with configuration
REM call %TEMPLATE%project.cmd %PROJECT_NAME% --config=wizard_config.json

echo Project setup complete!
