# Python Project Setup Script

This script automates the creation of a new Python project with a standard directory structure and configuration files. It also initializes a git repository, makes an initial commit, and syncs with a remote repository if one is configured.

## Features

- Creates a standard Python project structure
- Sets up a virtual environment
- Creates setup.py for package installation
- Adds requirements.txt and dev-requirements.txt for dependency management
- Includes a sample module and test
- Configures tools like Black, isort, and mypy
- Adds a LICENSE file (MIT)
- Creates a README.md with usage instructions
- Provides tests to validate source control setup and project structure

## Usage

```bash
pyproject.cmd project_name
```

Replace `project_name` with the name of your project.

The script will:
1. Check if you're already in a directory named `project_name`
2. If not, check if a `project_name` directory exists as a subfolder and navigate to it
3. If neither, create a new `project_name` directory and navigate to it
4. Set up the project structure
5. Activate the virtual environment
6. Initialize git, commit, and sync if a remote is configured

## Project Structure

The script creates the following structure:

```
project_name/
├── project_name/
│   ├── __init__.py
│   └── sample.py
├── tests/
│   ├── __init__.py
│   ├── test_sample.py
│   ├── test_source_control.py
│   └── test_template_structure.py
├── docs/
├── venv_project_name/
├── setup.py
├── requirements.txt
├── dev-requirements.txt
├── README.md
├── .gitignore
├── pyproject.toml
├── LICENSE
└── activate.cmd
```

## Getting Started

After running the script:

1. You'll already be in the project directory with the virtual environment activated
2. Install dependencies: `pip install -r requirements.txt`
3. Install the package in development mode: `pip install -e .`
4. Run tests: `pytest`
5. Validate source control setup: `pytest tests/test_source_control.py -v`
6. Validate project structure: `pytest tests/test_template_structure.py -v`

If you need to activate the virtual environment later, use the `activate.cmd` script.

### Source Control Validation

The included source control validation tests check that:

- The Git repository is properly initialized
- Required Git configuration is in place
- The project has appropriate `.gitignore` settings
- The project structure follows best practices
- At least one commit exists in the repository

### Project Structure Validation

The project structure validation tests ensure:

- Consistent project naming across files
- Proper virtual environment setup
- Expected package structure with required files
- Documentation and dependency files are present and properly formatted

## Requirements

- Python 3.6 or higher
- pip (usually comes with Python)

## Customization

You can customize this script to fit your specific needs by modifying the templates for each file. For example, you might want to:

- Add more dependencies to requirements.txt
- Change the license
- Add more directories to the project structure
- Configure different linting rules

## Benefits of Project-Specific Virtual Environments

The script creates a virtual environment named `venv_[project_name]` instead of the standard `venv`. This approach offers several advantages:

1. **Avoid Conflicts**: You can have multiple projects with their own isolated environments
2. **Clear Association**: The environment name clearly indicates which project it belongs to
3. **Better Organization**: Makes it easier to manage multiple projects on the same machine

## License

This script is provided under the MIT License. Feel free to use and modify it as needed.
