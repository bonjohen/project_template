# TypeScript Project Template

This repository contains a template for creating TypeScript projects with a standardized structure and configuration, following similar conventions to the JavaScript and Python project templates.

## Features

- Standard TypeScript project structure
- TypeScript configuration with tsconfig.json
- Jest for testing with TypeScript support
- ESLint for code linting with TypeScript-specific rules
- Prettier for code formatting
- Sample TypeScript modules with interfaces and type definitions
- Project structure validation tests
- MIT License
- Comprehensive documentation

## Usage

To create a new TypeScript project using this template:

```bash
.\tsproject.cmd your_project_name
```

This will create a new directory with the specified name and set up all the necessary files and structure.

## Project Structure

The template creates the following structure:

```
your_project_name/
├── src/
│   └── index.ts
├── dist/
├── tests/
│   ├── index.test.ts
│   └── template-structure.test.ts
├── docs/
├── types/
├── package.json
├── tsconfig.json
├── jest.config.js
├── .eslintrc.json
├── .prettierrc.json
├── .gitignore
├── LICENSE
├── README.md
└── TS_SETUP_README.md
```

### Key Files and Directories

- **src/**: Contains the TypeScript source code
  - **index.ts**: Main entry point with sample functions and interfaces
- **dist/**: Contains the compiled JavaScript output
- **tests/**: Contains test files
  - **index.test.ts**: Tests for the sample module
  - **template-structure.test.ts**: Tests to validate project structure
- **docs/**: For project documentation
- **types/**: For additional type definitions
- **package.json**: Project metadata and dependencies
- **tsconfig.json**: TypeScript compiler configuration
- **jest.config.js**: Jest testing framework configuration
- **.eslintrc.json**: ESLint configuration with TypeScript support
- **.prettierrc.json**: Prettier configuration
- **.gitignore**: Specifies files to ignore in Git
- **LICENSE**: MIT License
- **README.md**: Project documentation
- **TS_SETUP_README.md**: Documentation about the setup script

## TypeScript Features

The template includes several TypeScript-specific features:

1. **Type Definitions**: Sample interface and typed functions
2. **TypeScript Configuration**: Properly configured tsconfig.json
3. **Declaration Files**: Setup for generating .d.ts files
4. **TypeScript-aware Linting**: ESLint with TypeScript parser and plugins
5. **TypeScript Testing**: Jest configured with ts-jest for TypeScript support

## Getting Started

After creating a project:

1. Navigate to your project directory
2. Install dependencies:
   ```bash
   npm install
   ```
3. Install development dependencies:
   ```bash
   npm install --save-dev typescript ts-jest @types/jest jest @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint prettier
   ```
4. Build the project:
   ```bash
   npm run build
   ```
5. Run tests:
   ```bash
   npm test
   ```
6. Validate project structure:
   ```bash
   npm test tests/template-structure.test.ts
   ```

## Available Scripts

The template includes the following npm scripts:

- **build**: Compile TypeScript to JavaScript
- **dev**: Run TypeScript compiler in watch mode
- **test**: Run tests with Jest
- **lint**: Lint code with ESLint
- **format**: Format code with Prettier
- **coverage**: Run tests with coverage reporting

## Comparison with JavaScript and Python Templates

This TypeScript template follows similar conventions to the JavaScript and Python templates:

| Python Feature | JavaScript Equivalent | TypeScript Equivalent |
|----------------|------------------------|------------------------|
| pytest         | Jest                   | Jest with ts-jest      |
| flake8         | ESLint                 | ESLint with TypeScript plugins |
| black          | Prettier               | Prettier               |
| setup.py       | package.json           | package.json with types field |
| requirements.txt | package.json dependencies | package.json dependencies |
| dev-requirements.txt | package.json devDependencies | package.json devDependencies |
| pyproject.toml | .eslintrc.json & .prettierrc.json | tsconfig.json, .eslintrc.json & .prettierrc.json |
| venv           | node_modules           | node_modules           |

## Customization

Feel free to customize the template to fit your specific needs:

- Modify the TypeScript configuration in tsconfig.json
- Add additional TypeScript libraries and type definitions
- Adjust ESLint rules for your coding standards
- Configure Jest for different testing approaches
- Add additional npm scripts for your workflow
