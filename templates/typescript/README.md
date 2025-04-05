# typescript-template

A TypeScript project template with a standard directory structure and configuration files.

## Features

- Standard TypeScript project structure
- Testing with Jest
- Code formatting with Prettier
- Linting with ESLint
- Type definitions and declarations
- Comprehensive documentation

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/typescript-template.git
cd typescript-template

# Install dependencies
npm install
```

## Usage

```typescript
import { hello, createUser } from './src/index';

console.log(hello('World')); // Output: Hello, World!

const user = createUser('John Doe', 'john@example.com');
console.log(user);
```

## Development

### Building the Project

```bash
npm run build
```

### Running Tests

```bash
npm test
```

### Running Tests in Watch Mode

```bash
npm run test:watch
```

### Code Coverage

```bash
npm run test:coverage
```

### Linting

```bash
npm run lint
```

### Fixing Linting Issues

```bash
npm run lint:fix
```

### Formatting Code

```bash
npm run format
```

## Project Structure

```
typescript-template/
├── src/                  # Source code directory
│   └── index.ts          # Main module
├── dist/                 # Compiled JavaScript files
├── tests/                # Test directory
│   ├── index.test.ts     # Tests for main module
│   └── template-structure.test.ts # Tests for project structure
├── types/                # Type definitions
├── docs/                 # Documentation
├── .eslintrc.json        # ESLint configuration
├── .prettierrc.json      # Prettier configuration
├── .gitignore            # Git ignore file
├── jest.config.js        # Jest configuration
├── tsconfig.json         # TypeScript configuration
├── LICENSE               # License file
├── package.json          # Package configuration
└── README.md             # This file
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
