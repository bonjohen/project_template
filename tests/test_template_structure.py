"""Tests to validate that the Python project follows the template structure."""

import os
import re
import sys
from pathlib import Path
import pytest


def test_project_name_consistency():
    """Test that the project name is consistent across files."""
    # Get the project directory name
    project_dir = Path.cwd().name
    
    # Check setup.py for the project name
    setup_py_path = Path("setup.py")
    if setup_py_path.exists():
        setup_content = setup_py_path.read_text()
        # Extract name from setup.py
        name_match = re.search(r'name="([^"]+)"', setup_content)
        if name_match:
            setup_name = name_match.group(1)
            assert setup_name == project_dir, f"Project name in setup.py ({setup_name}) doesn't match directory name ({project_dir})"
    
    # Check pyproject.toml for project name
    pyproject_path = Path("pyproject.toml")
    if pyproject_path.exists():
        pyproject_content = pyproject_path.read_text()
        # Extract name from pyproject.toml if it contains project info
        name_match = re.search(r'name\s*=\s*"([^"]+)"', pyproject_content)
        if name_match:
            pyproject_name = name_match.group(1)
            assert pyproject_name == project_dir, f"Project name in pyproject.toml ({pyproject_name}) doesn't match directory name ({project_dir})"
    
    # Check that the main package directory exists with the same name
    package_dir = Path(project_dir)
    assert package_dir.exists(), f"Package directory {project_dir} not found"
    assert package_dir.is_dir(), f"{project_dir} is not a directory"


def test_virtual_environment():
    """Test that a virtual environment exists and is properly named."""
    # Check for venv_[project_name]
    project_dir = Path.cwd().name
    venv_name = f"venv_{project_dir}"
    venv_path = Path(venv_name)
    
    assert venv_path.exists(), f"Virtual environment {venv_name} not found"
    assert venv_path.is_dir(), f"{venv_name} is not a directory"
    
    # Check for key virtual environment directories/files
    venv_markers = [
        Path(venv_name) / "Scripts" / "python.exe",  # Windows
        Path(venv_name) / "bin" / "python",  # Unix
        Path(venv_name) / "pyvenv.cfg",  # Common to both
    ]
    
    found_marker = False
    for marker in venv_markers:
        if marker.exists():
            found_marker = True
            break
    
    assert found_marker, f"Virtual environment {venv_name} doesn't contain expected files"


def test_package_structure():
    """Test that the package has the expected structure."""
    project_dir = Path.cwd().name
    package_dir = Path(project_dir)
    
    # Check for __init__.py
    init_file = package_dir / "__init__.py"
    assert init_file.exists(), f"__init__.py not found in {project_dir} package"
    
    # Check for version in __init__.py
    init_content = init_file.read_text()
    version_match = re.search(r'__version__\s*=\s*"([^"]+)"', init_content)
    assert version_match, f"__version__ not found in {init_file}"
    
    # Check for at least one module file
    module_files = list(package_dir.glob("*.py"))
    assert len(module_files) > 1, f"No module files found in {project_dir} package besides __init__.py"


def test_test_structure():
    """Test that the tests directory has the expected structure."""
    tests_dir = Path("tests")
    
    # Check for __init__.py
    init_file = tests_dir / "__init__.py"
    assert init_file.exists(), "__init__.py not found in tests package"
    
    # Check for at least one test file
    test_files = list(tests_dir.glob("test_*.py"))
    assert test_files, "No test files found in tests directory"
    
    # Check that test files import pytest
    for test_file in test_files:
        content = test_file.read_text()
        assert "import pytest" in content, f"{test_file} doesn't import pytest"


def test_documentation():
    """Test that documentation files exist."""
    docs_dir = Path("docs")
    assert docs_dir.exists(), "docs directory not found"
    
    # Check for README.md
    readme_file = Path("README.md")
    assert readme_file.exists(), "README.md not found"
    
    # Check README.md content
    readme_content = readme_file.read_text()
    project_dir = Path.cwd().name
    assert project_dir in readme_content, f"Project name {project_dir} not found in README.md"
    
    # Check for sections in README.md
    expected_sections = ["Installation", "Usage", "Development"]
    for section in expected_sections:
        assert section in readme_content, f"{section} section not found in README.md"


def test_dependency_files():
    """Test that dependency files exist and have expected content."""
    # Check for requirements.txt
    req_file = Path("requirements.txt")
    assert req_file.exists(), "requirements.txt not found"
    
    # Check for dev-requirements.txt
    dev_req_file = Path("dev-requirements.txt")
    assert dev_req_file.exists(), "dev-requirements.txt not found"
    
    # Check that requirements.txt has content
    req_content = req_file.read_text()
    assert req_content.strip(), "requirements.txt is empty"
    
    # Check for pytest in requirements
    assert "pytest" in req_content, "pytest not found in requirements.txt"
    
    # Check dev-requirements.txt for development tools
    dev_req_content = dev_req_file.read_text()
    dev_tools = ["flake8", "black", "pytest"]
    found_tools = 0
    for tool in dev_tools:
        if tool in dev_req_content:
            found_tools += 1
    
    assert found_tools >= 2, f"dev-requirements.txt is missing common development tools, only found {found_tools}"


def test_license():
    """Test that a license file exists."""
    license_file = Path("LICENSE")
    assert license_file.exists(), "LICENSE file not found"
    
    # Check license content
    license_content = license_file.read_text()
    assert len(license_content) > 100, "LICENSE file seems too short"


def test_gitignore_python_specific():
    """Test that .gitignore has Python-specific entries."""
    gitignore_file = Path(".gitignore")
    assert gitignore_file.exists(), ".gitignore file not found"
    
    gitignore_content = gitignore_file.read_text()
    
    # Python-specific patterns
    python_patterns = [
        "__pycache__/",
        "*.py[cod]",
        "*$py.class",
        ".pytest_cache/",
        ".coverage",
        "htmlcov/",
        ".tox/",
        ".nox/",
        ".hypothesis/",
        ".egg-info/",
        "dist/",
        "build/",
    ]
    
    found_patterns = 0
    for pattern in python_patterns:
        if pattern in gitignore_content:
            found_patterns += 1
    
    assert found_patterns >= 5, f".gitignore is missing Python-specific patterns, only found {found_patterns}"


def test_activate_script():
    """Test that an activation script exists for the virtual environment."""
    activate_file = Path("activate.cmd")  # Windows
    activate_sh = Path("activate.sh")     # Unix
    
    assert activate_file.exists() or activate_sh.exists(), "No activation script found"
    
    if activate_file.exists():
        activate_content = activate_file.read_text()
        project_dir = Path.cwd().name
        venv_name = f"venv_{project_dir}"
        assert venv_name in activate_content, f"Activation script doesn't reference {venv_name}"
