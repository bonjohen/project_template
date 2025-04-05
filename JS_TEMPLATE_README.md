# JavaScript Project Template

This repository contains a template for creating JavaScript projects with a standardized structure and configuration, following similar conventions to the Python project template.

## Features

- Standard JavaScript project structure
- ESLint for code linting (equivalent to flake8 in Python)
- Prettier for code formatting (equivalent to black in Python)
- Jest for testing (equivalent to pytest in Python)
- Sample module and test files
- Project structure validation tests
- MIT License
- Comprehensive documentation

## Usage

To create a new JavaScript project using this template:

```bash
jsproject.cmd your_project_name
```

This will create a new directory with the specified name and set up all the necessary files and structure.

## Project Structure

The template creates the following structure:

```
your_project_name/
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

### Key Files and Directories

- **src/**: Contains the source code for your project
  - **index.js**: Main entry point with a sample function
- **tests/**: Contains test files
  - **index.test.js**: Tests for the sample module
  - **template-structure.test.js**: Tests to validate project structure
- **docs/**: For project documentation
- **package.json**: Project metadata and dependencies
- **.eslintrc.json**: ESLint configuration
- **.prettierrc.json**: Prettier configuration
- **.gitignore**: Specifies files to ignore in Git
- **LICENSE**: MIT License
- **README.md**: Project documentation
- **JS_SETUP_README.md**: Documentation about the setup script

## Getting Started

After creating a project:

1. Navigate to your project directory
2. Install dependencies:
   ```bash
   npm install
   ```
3. Install development dependencies:
   ```bash
   npm install --save-dev jest eslint prettier
   ```
4. Run tests:
   ```bash
   npm test
   ```
5. Validate project structure:
   ```bash
   npm test tests/template-structure.test.js
   ```

## Available Scripts

The template includes the following npm scripts:

- **test**: Run tests with Jest
- **lint**: Lint code with ESLint
- **format**: Format code with Prettier
- **coverage**: Run tests with coverage reporting

## Comparison with Python Template

This JavaScript template follows similar conventions to the Python template:

| Python Feature | JavaScript Equivalent |
|----------------|------------------------|
| pytest         | Jest                   |
| flake8         | ESLint                 |
| black          | Prettier               |
| setup.py       | package.json           |
| requirements.txt | package.json dependencies |
| dev-requirements.txt | package.json devDependencies |
| pyproject.toml | .eslintrc.json & .prettierrc.json |
| venv           | node_modules           |

## Customization

Feel free to customize the template to fit your specific needs:

- Add additional dependencies to package.json
- Modify ESLint and Prettier configurations
- Add more npm scripts for your workflow
- Extend the directory structure for larger projects
