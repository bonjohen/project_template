# JavaScript Project Setup Script 
 
This script automates the creation of a new JavaScript project with a standard directory structure and configuration files. 
 
## Features 
 
- Creates a standard JavaScript project structure 
- Sets up configuration for ESLint and Prettier 
- Creates package.json with common scripts 
- Includes a sample module and test 
- Adds a LICENSE file (MIT) 
- Creates a README.md with usage instructions 
- Provides tests to validate project structure 
 
## Usage 
 
```bash 
jsproject.cmd project_name 
``` 
 
Replace `project_name` with the name of your project. 
 
## Project Structure 
 
The script creates the following structure: 
 
```  
project_name/ 
├── src/ 
│   └── index.js 
├── tests/ 
│   ├── index.test.js 
│   └── template-structure.test.js 
├── docs/ 
├── package.json 
├── .eslintrc.json 
├── .prettierrc.json 
├── .gitignore 
├── LICENSE 
├── README.md 
└── JS_SETUP_README.md 
``` 
 
## Getting Started 
 
After running the script: 
 
1. Install dependencies: `npm install` 
2. Install development dependencies: 
   ```bash 
   npm install --save-dev jest eslint prettier 
   ``` 
3. Run tests: `npm test` 
4. Validate project structure: `npm test tests/template-structure.test.js` 
