@echo off
setlocal enabledelayedexpansion

set PROJECT_DIR=%~1
set TEMPLATE_TYPE=%~2
set UPDATE_MODE=%~3

if "%PROJECT_DIR%"=="" (
    echo ERROR: Please provide a project directory.
    exit /b 1
)

if "%TEMPLATE_TYPE%"=="" (
    echo ERROR: Please provide a template type.
    exit /b 1
)

if not exist "%PROJECT_DIR%" (
    echo ERROR: Project directory does not exist.
    exit /b 1
)

echo Checking for updates to %TEMPLATE_TYPE% template...

REM Compare template version with project version
set TEMPLATE_VERSION=
set PROJECT_VERSION=
for /f "tokens=*" %%a in ('type "%~dp0\templates\%TEMPLATE_TYPE%\VERSION"') do set TEMPLATE_VERSION=%%a
if exist "%PROJECT_DIR%\.template-version" (
    for /f "tokens=*" %%a in ('type "%PROJECT_DIR%\.template-version"') do set PROJECT_VERSION=%%a
)

if "%TEMPLATE_VERSION%"=="%PROJECT_VERSION%" (
    echo Project is already using the latest template version.
    exit /b 0
)

echo Project is using template version %PROJECT_VERSION%, latest is %TEMPLATE_VERSION%.

if "%UPDATE_MODE%"=="check" (
    echo Run with --update to apply changes.
    exit /b 0
)

REM Update configuration files
echo Updating configuration files...
copy "%~dp0\templates\%TEMPLATE_TYPE%\.eslintrc.json" "%PROJECT_DIR%\.eslintrc.json"
copy "%~dp0\templates\%TEMPLATE_TYPE%\.prettierrc.json" "%PROJECT_DIR%\.prettierrc.json"
copy "%~dp0\templates\%TEMPLATE_TYPE%\jest.config.js" "%PROJECT_DIR%\jest.config.js"

REM Update template version
echo %TEMPLATE_VERSION% > "%PROJECT_DIR%\.template-version"

echo Template updated successfully!
