# python-template

A Python project template with a standard directory structure and configuration files.

## Features

- Standard Python package structure
- Testing with pytest
- Code formatting with Black and isort
- Type checking with mypy
- Linting with flake8
- Documentation with Sphinx
- Virtual environment management

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/python-template.git
cd python-template

# Create and activate a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
pip install -r dev-requirements.txt

# Install the package in development mode
pip install -e .
```

## Usage

```python
from python_template.sample import hello

print(hello("World"))  # Output: Hello, World!
```

## Development

### Running Tests

```bash
pytest
```

### Code Formatting

```bash
black .
isort .
```

### Type Checking

```bash
mypy python_template
```

### Linting

```bash
flake8 python_template
```

## Project Structure

```
python-template/
├── python_template/       # Source code package
│   ├── __init__.py        # Package initialization
│   └── sample.py          # Sample module
├── tests/                 # Test directory
│   ├── __init__.py        # Test package initialization
│   └── test_sample.py     # Tests for sample module
├── docs/                  # Documentation
├── .gitignore             # Git ignore file
├── LICENSE                # License file
├── README.md              # This file
├── pyproject.toml         # Project configuration
├── setup.py               # Package setup script
├── requirements.txt       # Project dependencies
└── dev-requirements.txt   # Development dependencies
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
