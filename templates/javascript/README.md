# javascript-template

A JavaScript project template with a standard directory structure and configuration files.

## Features

- Standard JavaScript project structure
- Testing with Jest
- Code formatting with Prettier
- Linting with ESLint
- Comprehensive documentation

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/javascript-template.git
cd javascript-template

# Install dependencies
npm install
```

## Usage

```javascript
const { hello, createUser } = require('./src/index');

console.log(hello('World')); // Output: Hello, World!

const user = createUser('John Doe', 'john@example.com');
console.log(user);
```

## Development

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
javascript-template/
├── src/                  # Source code directory
│   └── index.js          # Main module
├── tests/                # Test directory
│   ├── index.test.js     # Tests for main module
│   └── template-structure.test.js # Tests for project structure
├── docs/                 # Documentation
├── .eslintrc.json        # ESLint configuration
├── .prettierrc.json      # Prettier configuration
├── .gitignore            # Git ignore file
├── jest.config.js        # Jest configuration
├── LICENSE               # License file
├── package.json          # Package configuration
└── README.md             # This file
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
