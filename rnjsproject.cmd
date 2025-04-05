@echo off
setlocal enabledelayedexpansion

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Please provide a project name.
    echo Usage: rnjsproject.cmd project_name
    exit /b 1
)

set PROJECT_NAME=%~1

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
echo Setting up React/Next.js project in: %PROJECT_DIR%

REM Create project directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%\src"
mkdir "%PROJECT_DIR%\src\app"
mkdir "%PROJECT_DIR%\src\components"
mkdir "%PROJECT_DIR%\src\components\ui"
mkdir "%PROJECT_DIR%\src\lib"
mkdir "%PROJECT_DIR%\src\styles"
mkdir "%PROJECT_DIR%\public"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\tests\components"
mkdir "%PROJECT_DIR%\tests\components\ui"
mkdir "%PROJECT_DIR%\tests\app"
mkdir "%PROJECT_DIR%\docs"

REM Create template files
echo Creating template files...
copy "%~dp0\templates\nextjs\package.json" "%PROJECT_DIR%\package.json"
copy "%~dp0\templates\nextjs\tsconfig.json" "%PROJECT_DIR%\tsconfig.json"
copy "%~dp0\templates\nextjs\next.config.js" "%PROJECT_DIR%\next.config.js"
copy "%~dp0\templates\nextjs\.eslintrc.json" "%PROJECT_DIR%\.eslintrc.json"
copy "%~dp0\templates\nextjs\.prettierrc.json" "%PROJECT_DIR%\.prettierrc.json"
copy "%~dp0\templates\nextjs\jest.config.js" "%PROJECT_DIR%\jest.config.js"
copy "%~dp0\templates\nextjs\jest.setup.js" "%PROJECT_DIR%\jest.setup.js"
copy "%~dp0\templates\nextjs\postcss.config.js" "%PROJECT_DIR%\postcss.config.js"
copy "%~dp0\templates\nextjs\tailwind.config.js" "%PROJECT_DIR%\tailwind.config.js"
copy "%~dp0\templates\nextjs\globals.css" "%PROJECT_DIR%\src\styles\globals.css"
copy "%~dp0\templates\nextjs\layout.tsx" "%PROJECT_DIR%\src\app\layout.tsx"
copy "%~dp0\templates\nextjs\page.tsx" "%PROJECT_DIR%\src\app\page.tsx"
copy "%~dp0\templates\nextjs\Button.tsx" "%PROJECT_DIR%\src\components\ui\Button.tsx"
copy "%~dp0\templates\nextjs\Button.test.tsx" "%PROJECT_DIR%\tests\components\ui\Button.test.tsx"
copy "%~dp0\templates\nextjs\page.test.tsx" "%PROJECT_DIR%\tests\app\page.test.tsx"
copy "%~dp0\templates\nextjs\template-structure.test.ts" "%PROJECT_DIR%\tests\template-structure.test.ts"
copy "%~dp0\templates\nextjs\README.md" "%PROJECT_DIR%\README.md"
copy "%~dp0\templates\nextjs\.gitignore" "%PROJECT_DIR%\.gitignore"
copy "%~dp0\templates\nextjs\NEXTJS_SETUP_README.md" "%PROJECT_DIR%\NEXTJS_SETUP_README.md"

REM Replace project name in files
echo Customizing files for %PROJECT_NAME%...
powershell -Command "(Get-Content '%PROJECT_DIR%\package.json') -replace 'nextjs-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\package.json'"
powershell -Command "(Get-Content '%PROJECT_DIR%\src\app\layout.tsx') -replace 'NextJS Template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\src\app\layout.tsx'"
powershell -Command "(Get-Content '%PROJECT_DIR%\src\app\page.tsx') -replace 'NextJS Template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\src\app\page.tsx'"
powershell -Command "(Get-Content '%PROJECT_DIR%\README.md') -replace 'nextjs-template', '%PROJECT_NAME%' | Set-Content '%PROJECT_DIR%\README.md'"

REM Display completion message
echo.
echo React/Next.js project setup complete!
echo.
echo Next steps:
echo 1. Navigate to the project directory: cd %PROJECT_NAME%
echo 2. Install dependencies: npm install
echo 3. Start the development server: npm run dev
echo 4. Run tests: npm test
echo.
echo For more information, see the README.md file in your project directory

endlocal