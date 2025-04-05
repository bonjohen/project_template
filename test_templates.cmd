@echo off
setlocal enabledelayedexpansion

echo ===== Testing Project Templates =====

REM Create a test directory
set TEST_DIR=template_tests
if exist "%TEST_DIR%" (
    echo Removing existing test directory...
    rmdir /s /q "%TEST_DIR%"
)
mkdir "%TEST_DIR%"
cd "%TEST_DIR%"

echo.
echo ===== Testing Python Template =====
echo.
call ..\pyproject_template.cmd test_py_project
cd test_py_project
echo Installing dependencies...
call venv\Scripts\activate.bat
pip install -r requirements.txt
pip install -e .
echo Running tests...
pytest
cd ..
echo.

echo.
echo ===== Testing JavaScript Template =====
echo.
call ..\jsproject_template.cmd test_js_project
cd test_js_project
echo Installing dependencies...
npm install --silent
echo Running tests...
npm test
cd ..
echo.

echo.
echo ===== Testing TypeScript Template =====
echo.
call ..\tsproject_template.cmd test_ts_project
cd test_ts_project
echo Installing dependencies...
npm install --silent
echo Running tests...
npm test
cd ..
echo.

echo.
echo ===== Testing React/Next.js Template =====
echo.
call ..\rnjsproject.cmd test_nextjs_project
cd test_nextjs_project
echo Installing dependencies...
npm install --silent
echo Running tests...
npm test
cd ..
echo.

echo.
echo ===== All Tests Completed =====
echo.

REM Clean up
cd ..
echo Cleaning up test directory...
rmdir /s /q "%TEST_DIR%"

echo All templates have been tested successfully!

endlocal
