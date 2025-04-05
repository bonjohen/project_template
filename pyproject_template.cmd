@echo off
setlocal enabledelayedexpansion

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Please provide a project name.
    echo Usage: pyproject.cmd project_name
    exit /b 1
)

set PROJECT_NAME=%~1

echo ===== Python Project Setup =====

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
echo Setting up Python project in: %PROJECT_DIR%

REM Create directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%\%PROJECT_NAME%"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\docs"

REM Create virtual environment
echo Creating virtual environment...
python -m venv "%PROJECT_DIR%\venv"

REM Copy template files
echo Copying template files...
copy "%~dp0\templates\python\__init__.py" "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"
copy "%~dp0\templates\python\sample.py" "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
copy "%~dp0\templates\python\test_init.py" "%PROJECT_DIR%\tests\__init__.py"
copy "%~dp0\templates\python\test_sample.py" "%PROJECT_DIR%\tests\test_sample.py"
copy "%~dp0\templates\python\pyproject.toml" "%PROJECT_DIR%\pyproject.toml"
copy "%~dp0\templates\python\setup.py" "%PROJECT_DIR%\setup.py"
copy "%~dp0\templates\python\requirements.txt" "%PROJECT_DIR%\requirements.txt"
copy "%~dp0\templates\python\dev-requirements.txt" "%PROJECT_DIR%\dev-requirements.txt"
copy "%~dp0\templates\python\README.md" "%PROJECT_DIR%\README.md"
copy "%~dp0\templates\python\.gitignore" "%PROJECT_DIR%\.gitignore"
copy "%~dp0\templates\python\LICENSE" "%PROJECT_DIR%\LICENSE"
copy "%~dp0\templates\python\activate.cmd" "%PROJECT_DIR%\activate.cmd"

REM Replace project name in files
echo Customizing files for %PROJECT_NAME%...
powershell -Command "(Get-Content '%PROJECT_DIR%\%PROJECT_NAME%\__init__.py') -replace 'python-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\%PROJECT_NAME%\__init__.py'"
powershell -Command "(Get-Content '%PROJECT_DIR%\tests\test_sample.py') -replace 'python_template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\tests\test_sample.py'"
powershell -Command "(Get-Content '%PROJECT_DIR%\setup.py') -replace 'python-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\setup.py'"
powershell -Command "(Get-Content '%PROJECT_DIR%\README.md') -replace 'python-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\README.md'"

echo Python project "%PROJECT_NAME%" created successfully

REM Activate virtual environment
echo Activating virtual environment...
call "%PROJECT_DIR%\venv\Scripts\activate.bat"

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

echo Setup complete You are now in the activated virtual environment.
echo.
echo Next steps:
echo 1. pip install -r requirements.txt
echo 2. pip install -e .
echo 3. pytest
echo.
echo Happy coding

endlocal
