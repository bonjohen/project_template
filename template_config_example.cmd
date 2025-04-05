@echo off
REM Example of how configuration options could work
set PROJECT_NAME=%~1
set CONFIG_FILE=%~2

REM Default configuration
set USE_TYPESCRIPT=true
set INCLUDE_TESTING=true
set LICENSE_TYPE=MIT

REM Load configuration from file if provided
if not "%CONFIG_FILE%"=="" (
    if exist "%CONFIG_FILE%" (
        echo Loading configuration from %CONFIG_FILE%...
        for /f "tokens=1,* delims==" %%a in (%CONFIG_FILE%) do (
            set %%a=%%b
        )
    )
)

REM Use configuration values
if "%USE_TYPESCRIPT%"=="true" (
    echo Including TypeScript support...
) else (
    echo Using JavaScript only...
)

if "%INCLUDE_TESTING%"=="true" (
    echo Setting up testing framework...
) else (
    echo Skipping test setup...
)

echo Using %LICENSE_TYPE% license...
