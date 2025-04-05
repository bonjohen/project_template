# vsc_template

A short description of the project.

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/vsc_template.git
cd vsc_template

# Create and activate virtual environment
python -m venv venv_vsc_template
venv_vsc_template\Scripts\activate # On Windows
# source venv_vsc_template/bin/activate # On Unix/macOS

# Install dependencies
pip install -r requirements.txt

# Install in development mode
pip install -e .
```

## Usage

```python
import vsc_template

# Add usage examples here
```

## Development

```bash
# Install development dependencies
pip install -r dev-requirements.txt

# Run tests
pytest

# Run tests with coverage
pytest --cov=vsc_template

# Run source control validation tests
pytest tests/test_source_control.py

# Run project structure validation tests
pytest tests/test_template_structure.py
```

## Source Control Validation

This project includes tests to validate that it has been properly added to source control:

- Verifies Git repository setup (`.git` directory, configuration)
- Checks for required files (`.gitignore`, etc.)
- Validates project structure and organization
- Ensures proper Git commit history

Run these tests after setting up a new project to ensure everything is configured correctly:

```bash
pytest tests/test_source_control.py -v
```

## Project Structure Validation

Additional tests validate that the project follows the expected template structure:

- Consistent project naming across files
- Proper virtual environment setup
- Expected package structure and organization
- Documentation and dependency management

Run these tests to verify the project structure:

```bash
pytest tests/test_template_structure.py -v
```

## License

[MIT](LICENSE)
