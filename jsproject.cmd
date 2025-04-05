@echo off
setlocal enabledelayedexpansion

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Please provide a project name.
    echo Usage: jsproject.cmd project_name
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
echo Setting up JavaScript project in: %PROJECT_DIR%

REM Create project directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%\src"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\docs"

REM Create package.json
echo Creating package.json...
echo { > "%PROJECT_DIR%\package.json"
echo   "name": "%PROJECT_NAME%", >> "%PROJECT_DIR%\package.json"
echo   "version": "0.1.0", >> "%PROJECT_DIR%\package.json"
echo   "description": "A short description of the project", >> "%PROJECT_DIR%\package.json"
echo   "main": "src/index.js", >> "%PROJECT_DIR%\package.json"
echo   "scripts": { >> "%PROJECT_DIR%\package.json"
echo     "test": "jest", >> "%PROJECT_DIR%\package.json"
echo     "lint": "eslint .", >> "%PROJECT_DIR%\package.json"
echo     "format": "prettier --write .", >> "%PROJECT_DIR%\package.json"
echo     "coverage": "jest --coverage" >> "%PROJECT_DIR%\package.json"
echo   }, >> "%PROJECT_DIR%\package.json"
echo   "keywords": ["javascript", "project"], >> "%PROJECT_DIR%\package.json"
echo   "author": "Your Name <your.email@example.com>", >> "%PROJECT_DIR%\package.json"
echo   "license": "MIT", >> "%PROJECT_DIR%\package.json"
echo   "devDependencies": {}, >> "%PROJECT_DIR%\package.json"
echo   "dependencies": {} >> "%PROJECT_DIR%\package.json"
echo } >> "%PROJECT_DIR%\package.json"

REM Create .eslintrc.json
echo Creating .eslintrc.json...
echo { > "%PROJECT_DIR%\.eslintrc.json"
echo   "env": { >> "%PROJECT_DIR%\.eslintrc.json"
echo     "browser": true, >> "%PROJECT_DIR%\.eslintrc.json"
echo     "es2021": true, >> "%PROJECT_DIR%\.eslintrc.json"
echo     "node": true, >> "%PROJECT_DIR%\.eslintrc.json"
echo     "jest": true >> "%PROJECT_DIR%\.eslintrc.json"
echo   }, >> "%PROJECT_DIR%\.eslintrc.json"
echo   "extends": ["eslint:recommended"], >> "%PROJECT_DIR%\.eslintrc.json"
echo   "parserOptions": { >> "%PROJECT_DIR%\.eslintrc.json"
echo     "ecmaVersion": "latest", >> "%PROJECT_DIR%\.eslintrc.json"
echo     "sourceType": "module" >> "%PROJECT_DIR%\.eslintrc.json"
echo   }, >> "%PROJECT_DIR%\.eslintrc.json"
echo   "rules": {} >> "%PROJECT_DIR%\.eslintrc.json"
echo } >> "%PROJECT_DIR%\.eslintrc.json"

REM Create .prettierrc.json
echo Creating .prettierrc.json...
echo { > "%PROJECT_DIR%\.prettierrc.json"
echo   "semi": true, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "singleQuote": true, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "tabWidth": 2, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "printWidth": 80, >> "%PROJECT_DIR%\.prettierrc.json"
echo   "trailingComma": "es5" >> "%PROJECT_DIR%\.prettierrc.json"
echo } >> "%PROJECT_DIR%\.prettierrc.json"

REM Create sample module
echo Creating sample module...
echo /**  > "%PROJECT_DIR%\src\index.js"
echo  * Sample module. >> "%PROJECT_DIR%\src\index.js"
echo  */ >> "%PROJECT_DIR%\src\index.js"
echo. >> "%PROJECT_DIR%\src\index.js"
echo /**  >> "%PROJECT_DIR%\src\index.js"
echo  * Return a greeting message. >> "%PROJECT_DIR%\src\index.js"
echo  * @param {string} name - The name to greet. >> "%PROJECT_DIR%\src\index.js"
echo  * @returns {string} A greeting message. >> "%PROJECT_DIR%\src\index.js"
echo  */ >> "%PROJECT_DIR%\src\index.js"
echo function hello(name) { >> "%PROJECT_DIR%\src\index.js"
echo   return `Hello, ${name}!`; >> "%PROJECT_DIR%\src\index.js"
echo } >> "%PROJECT_DIR%\src\index.js"
echo. >> "%PROJECT_DIR%\src\index.js"
echo // Export functions for use in other modules >> "%PROJECT_DIR%\src\index.js"
echo module.exports = { >> "%PROJECT_DIR%\src\index.js"
echo   hello, >> "%PROJECT_DIR%\src\index.js"
echo }; >> "%PROJECT_DIR%\src\index.js"

REM Create sample test
echo Creating sample test...
echo /**  > "%PROJECT_DIR%\tests\index.test.js"
echo  * Tests for the sample module. >> "%PROJECT_DIR%\tests\index.test.js"
echo  */ >> "%PROJECT_DIR%\tests\index.test.js"
echo. >> "%PROJECT_DIR%\tests\index.test.js"
echo const { hello } = require('../src/index'); >> "%PROJECT_DIR%\tests\index.test.js"
echo. >> "%PROJECT_DIR%\tests\index.test.js"
echo describe('hello function', () => { >> "%PROJECT_DIR%\tests\index.test.js"
echo   test('returns correct greeting', () => { >> "%PROJECT_DIR%\tests\index.test.js"
echo     expect(hello('World')).toBe('Hello, World!'); >> "%PROJECT_DIR%\tests\index.test.js"
echo     expect(hello('JavaScript')).toBe('Hello, JavaScript!'); >> "%PROJECT_DIR%\tests\index.test.js"
echo   }); >> "%PROJECT_DIR%\tests\index.test.js"
echo }); >> "%PROJECT_DIR%\tests\index.test.js"

REM Create README.md
echo Creating README.md...
echo # %PROJECT_NAME% > "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo A short description of the project. >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Installation >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo # Clone the repository >> "%PROJECT_DIR%\README.md"
echo git clone https://github.com/yourusername/%PROJECT_NAME%.git >> "%PROJECT_DIR%\README.md"
echo cd %PROJECT_NAME% >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Install dependencies >> "%PROJECT_DIR%\README.md"
echo npm install >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Usage >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```javascript >> "%PROJECT_DIR%\README.md"
echo const { hello } = require('%PROJECT_NAME%'); >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo // Add usage examples here >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Development >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo # Run tests >> "%PROJECT_DIR%\README.md"
echo npm test >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Run tests with coverage >> "%PROJECT_DIR%\README.md"
echo npm run coverage >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Lint code >> "%PROJECT_DIR%\README.md"
echo npm run lint >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Format code >> "%PROJECT_DIR%\README.md"
echo npm run format >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"

REM Create .gitignore
echo Creating .gitignore...
echo # Logs > "%PROJECT_DIR%\.gitignore"
echo logs >> "%PROJECT_DIR%\.gitignore"
echo *.log >> "%PROJECT_DIR%\.gitignore"
echo npm-debug.log* >> "%PROJECT_DIR%\.gitignore"
echo yarn-debug.log* >> "%PROJECT_DIR%\.gitignore"
echo yarn-error.log* >> "%PROJECT_DIR%\.gitignore"
echo lerna-debug.log* >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Diagnostic reports (https://nodejs.org/api/report.html) >> "%PROJECT_DIR%\.gitignore"
echo report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Runtime data >> "%PROJECT_DIR%\.gitignore"
echo pids >> "%PROJECT_DIR%\.gitignore"
echo *.pid >> "%PROJECT_DIR%\.gitignore"
echo *.seed >> "%PROJECT_DIR%\.gitignore"
echo *.pid.lock >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Directory for instrumented libs generated by jscoverage/JSCover >> "%PROJECT_DIR%\.gitignore"
echo lib-cov >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Coverage directory used by tools like istanbul >> "%PROJECT_DIR%\.gitignore"
echo coverage >> "%PROJECT_DIR%\.gitignore"
echo *.lcov >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # nyc test coverage >> "%PROJECT_DIR%\.gitignore"
echo .nyc_output >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # node-waf configuration >> "%PROJECT_DIR%\.gitignore"
echo .lock-wscript >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Dependency directories >> "%PROJECT_DIR%\.gitignore"
echo node_modules/ >> "%PROJECT_DIR%\.gitignore"
echo jspm_packages/ >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # TypeScript cache >> "%PROJECT_DIR%\.gitignore"
echo *.tsbuildinfo >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Optional npm cache directory >> "%PROJECT_DIR%\.gitignore"
echo .npm >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Optional eslint cache >> "%PROJECT_DIR%\.gitignore"
echo .eslintcache >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # dotenv environment variables file >> "%PROJECT_DIR%\.gitignore"
echo .env >> "%PROJECT_DIR%\.gitignore"
echo .env.test >> "%PROJECT_DIR%\.gitignore"
echo .env.local >> "%PROJECT_DIR%\.gitignore"
echo .env.development.local >> "%PROJECT_DIR%\.gitignore"
echo .env.test.local >> "%PROJECT_DIR%\.gitignore"
echo .env.production.local >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # IDE files >> "%PROJECT_DIR%\.gitignore"
echo .idea/ >> "%PROJECT_DIR%\.gitignore"
echo .vscode/ >> "%PROJECT_DIR%\.gitignore"
echo *.swp >> "%PROJECT_DIR%\.gitignore"
echo *.swo >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # OS files >> "%PROJECT_DIR%\.gitignore"
echo .DS_Store >> "%PROJECT_DIR%\.gitignore"
echo Thumbs.db >> "%PROJECT_DIR%\.gitignore"
echo ehthumbs.db >> "%PROJECT_DIR%\.gitignore"

REM Create test validation file
echo Creating test validation file...
echo /**  > "%PROJECT_DIR%\tests\template-structure.test.js"
echo  * Tests to validate that the JavaScript project follows the template structure. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo  */ >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo const fs = require('fs'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo const path = require('path'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo describe('Project structure validation', () => { >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   test('has required directories', () => { >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('src')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('tests')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('docs')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   test('has required configuration files', () => { >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('package.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('.eslintrc.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('.prettierrc.json')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('.gitignore')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   test('has sample module', () => { >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('src/index.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     const indexContent = fs.readFileSync('src/index.js', 'utf8'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(indexContent).toContain('function hello'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo. >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   test('has sample test', () => { >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(fs.existsSync('tests/index.test.js')).toBe(true); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     const testContent = fs.readFileSync('tests/index.test.js', 'utf8'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(testContent).toContain('describe'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo     expect(testContent).toContain('test'); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo   }); >> "%PROJECT_DIR%\tests\template-structure.test.js"
echo }); >> "%PROJECT_DIR%\tests\template-structure.test.js"

REM Create LICENSE file
echo Creating LICENSE file...
echo MIT License > "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo Copyright (c) %date:~10,4% Your Name >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo Permission is hereby granted, free of charge, to any person obtaining a copy >> "%PROJECT_DIR%\LICENSE"
echo of this software and associated documentation files (the "Software"), to deal >> "%PROJECT_DIR%\LICENSE"
echo in the Software without restriction, including without limitation the rights >> "%PROJECT_DIR%\LICENSE"
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell >> "%PROJECT_DIR%\LICENSE"
echo copies of the Software, and to permit persons to whom the Software is >> "%PROJECT_DIR%\LICENSE"
echo furnished to do so, subject to the following conditions: >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo The above copyright notice and this permission notice shall be included in all >> "%PROJECT_DIR%\LICENSE"
echo copies or substantial portions of the Software. >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR >> "%PROJECT_DIR%\LICENSE"
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, >> "%PROJECT_DIR%\LICENSE"
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE >> "%PROJECT_DIR%\LICENSE"
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER >> "%PROJECT_DIR%\LICENSE"
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, >> "%PROJECT_DIR%\LICENSE"
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE >> "%PROJECT_DIR%\LICENSE"
echo SOFTWARE. >> "%PROJECT_DIR%\LICENSE"

REM Create a JavaScript setup README
echo Creating JS_SETUP_README.md...
echo # JavaScript Project Setup Script > "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo This script automates the creation of a new JavaScript project with a standard directory structure and configuration files. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ## Features >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Creates a standard JavaScript project structure >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Sets up configuration for ESLint and Prettier >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Creates package.json with common scripts >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Includes a sample module and test >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Adds a LICENSE file (MIT) >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Creates a README.md with usage instructions >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo - Provides tests to validate project structure >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ## Usage >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ```bash >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo jsproject.cmd project_name >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ``` >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo Replace `project_name` with the name of your project. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ## Project Structure >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo The script creates the following structure: >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ```  >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo project_name/ >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── src/ >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo │   └── index.js >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── tests/ >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo │   ├── index.test.js >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo │   └── template-structure.test.js >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── docs/ >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── package.json >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── .eslintrc.json >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── .prettierrc.json >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── .gitignore >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── LICENSE >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ├── README.md >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo └── JS_SETUP_README.md >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ``` >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo ## Getting Started >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo After running the script: >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo. >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo 1. Install dependencies: `npm install` >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo 2. Install development dependencies: >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo    ```bash >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo    npm install --save-dev jest eslint prettier >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo    ``` >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo 3. Run tests: `npm test` >> "%PROJECT_DIR%\JS_SETUP_README.md"
echo 4. Validate project structure: `npm test tests/template-structure.test.js` >> "%PROJECT_DIR%\JS_SETUP_README.md"

REM Display completion message
echo.
echo JavaScript project setup complete!
echo.
echo Next steps:
echo 1. Install dependencies: npm install
echo 2. Install development dependencies: npm install --save-dev jest eslint prettier
echo 3. Run tests: npm test
echo 4. Validate project structure: npm test tests/template-structure.test.js
echo.
echo For more information, see JS_SETUP_README.md

endlocal
