# Validation Tests

This document describes the validation tests included in this project template to ensure proper setup and configuration.

## Overview

The template includes two types of validation tests:

1. **Source Control Validation Tests**: Ensure the project is properly set up with Git source control
2. **Project Structure Validation Tests**: Verify the project follows the expected template structure

These tests help maintain consistency across projects and catch configuration issues early.

## Source Control Validation Tests

Located in `tests/test_source_control.py`, these tests verify that the project is properly set up with Git source control.

### Tests Included

| Test Name | Description |
|-----------|-------------|
| `test_git_repository_exists` | Checks that the `.git` directory exists |
| `test_gitignore_exists` | Verifies that `.gitignore` exists with appropriate Python patterns |
| `test_required_project_structure` | Ensures all required directories and files exist |
| `test_git_status` | Checks that there are no uncommitted changes |
| `test_git_config` | Verifies that user.name and user.email are configured |
| `test_git_remote` | Checks if a remote repository is configured (optional) |
| `test_git_initial_commit` | Ensures that at least one commit exists |
| `test_python_specific_git_attributes` | Checks for Python-specific git attributes (optional) |
| `test_branch_naming` | Verifies that the branch follows naming conventions |

### Running the Tests

```bash
# Run all source control tests
pytest tests/test_source_control.py

# Run with verbose output
pytest tests/test_source_control.py -v

# Run a specific test
pytest tests/test_source_control.py::test_git_repository_exists
```

## Project Structure Validation Tests

Located in `tests/test_template_structure.py`, these tests verify that the project follows the expected template structure.

### Tests Included

| Test Name | Description |
|-----------|-------------|
| `test_project_name_consistency` | Ensures the project name is consistent across files |
| `test_virtual_environment` | Checks that a properly named virtual environment exists |
| `test_package_structure` | Verifies the main package has the expected structure |
| `test_test_structure` | Ensures the tests directory has the expected structure |
| `test_documentation` | Checks that documentation files exist with expected content |
| `test_dependency_files` | Verifies that requirements files exist with expected content |
| `test_license` | Ensures a license file exists |
| `test_gitignore_python_specific` | Checks that `.gitignore` has Python-specific entries |
| `test_activate_script` | Verifies that an activation script exists for the virtual environment |

### Running the Tests

```bash
# Run all project structure tests
pytest tests/test_template_structure.py

# Run with verbose output
pytest tests/test_template_structure.py -v

# Run a specific test
pytest tests/test_template_structure.py::test_package_structure
```

## Using the Tests in Your Workflow

### Initial Project Setup

After creating a new project from the template:

1. Initialize Git: `git init`
2. Configure Git: `git config user.name "Your Name"` and `git config user.email "your.email@example.com"`
3. Make an initial commit: `git add .` and `git commit -m "Initial commit"`
4. Run the validation tests: `pytest tests/test_source_control.py tests/test_template_structure.py -v`

### Continuous Integration

Add these tests to your CI pipeline to ensure that the project structure remains consistent:

```yaml
# Example GitHub Actions workflow step
- name: Run validation tests
  run: |
    pip install pytest
    pytest tests/test_source_control.py tests/test_template_structure.py -v
```

### Pre-commit Checks

Use these tests as part of pre-commit hooks to ensure that commits don't break the expected structure.

### Project Auditing

Run these tests periodically to audit existing projects and ensure they maintain the expected structure.

## Extending the Tests

These tests can be extended in several ways:

1. **Additional Git Checks**: Add tests for specific Git workflows, branch protection rules, or commit message conventions.
2. **Project-Specific Checks**: Add tests for project-specific files or configurations.
3. **CI/CD Integration**: Add tests that verify CI/CD configuration files are present and valid.
4. **Dependency Management**: Add more detailed tests for dependency management, such as checking for pinned versions or security vulnerabilities.

## Troubleshooting

If tests are failing, here are some common issues and solutions:

### Source Control Tests

- **Git repository not found**: Run `git init` to initialize a Git repository
- **Git configuration missing**: Set up user.name and user.email with `git config`
- **No commits**: Make an initial commit with `git add .` and `git commit -m "Initial commit"`

### Project Structure Tests

- **Project name inconsistency**: Ensure the project name is consistent in setup.py, directory names, etc.
- **Missing files**: Check that all required files exist in the expected locations
- **Virtual environment issues**: Verify that the virtual environment is named correctly and contains the expected files
