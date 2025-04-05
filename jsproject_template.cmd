@echo off
setlocal enabledelayedexpansion

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Please provide a project name.
    echo Usage: jsproject.cmd project_name
    exit /b 1
)

set PROJECT_NAME=%~1

echo ===== JavaScript Project Setup =====

REM Check if we're already in a directory with the project name
if "%CD:~-\%PROJECT_NAME%"=="%PROJECT_NAME%" (
    echo Already in %PROJECT_NAME% directory.
    set PROJECT_DIR=%CD%
    goto continue_setup
)

REM Check if project directory exists
if exist "%PROJECT_NAME%\" (
    echo %PROJECT_NAME% directory already exists.
    echo Navigating to existing directory...
    cd "%PROJECT_NAME%"
    set PROJECT_DIR=%CD%
    goto continue_setup
)

REM Create and navigate to project directory
echo Creating %PROJECT_NAME% directory...
mkdir "%PROJECT_NAME%"
cd "%PROJECT_NAME%"
set PROJECT_DIR=%CD%

:continue_setup
echo Setting up JavaScript project in: %PROJECT_DIR%

REM Create directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%\src"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\docs"

REM Copy template files
echo Copying template files...
copy "%~dp0\templates\javascript\index.js" "%PROJECT_DIR%\src\index.js"
copy "%~dp0\templates\javascript\index.test.js" "%PROJECT_DIR%\tests\index.test.js"
copy "%~dp0\templates\javascript\template-structure.test.js" "%PROJECT_DIR%\tests\template-structure.test.js"
copy "%~dp0\templates\javascript\package.json" "%PROJECT_DIR%\package.json"
copy "%~dp0\templates\javascript\.eslintrc.json" "%PROJECT_DIR%\.eslintrc.json"
copy "%~dp0\templates\javascript\.prettierrc.json" "%PROJECT_DIR%\.prettierrc.json"
copy "%~dp0\templates\javascript\jest.config.js" "%PROJECT_DIR%\jest.config.js"
copy "%~dp0\templates\javascript\.gitignore" "%PROJECT_DIR%\.gitignore"
copy "%~dp0\templates\javascript\README.md" "%PROJECT_DIR%\README.md"
copy "%~dp0\templates\javascript\LICENSE" "%PROJECT_DIR%\LICENSE"

REM Replace project name in files
echo Customizing files for %PROJECT_NAME%...
powershell -Command "(Get-Content '%PROJECT_DIR%\package.json') -replace 'javascript-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\package.json'"
powershell -Command "(Get-Content '%PROJECT_DIR%\README.md') -replace 'javascript-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\README.md'"

echo JavaScript project "%PROJECT_NAME%" created successfully

REM Initialize git repository
echo Initializing git repository...
git init
echo Adding files to git...
git add .
echo Creating initial commit...
git commit -m "Initial commit for %PROJECT_NAME% project"
echo No remote repository configured.
echo To add a remote repository, use: git remote add origin [repository-url]
echo Then push with: git push -u origin main

echo Setup complete
echo.
echo Next steps:
echo 1. npm install
echo 2. npm test
echo.
echo Happy coding

endlocal
