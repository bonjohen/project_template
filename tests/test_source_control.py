"""Tests to validate that the template Python project is properly added to source control."""

import os
import subprocess
import pytest
from pathlib import Path


def run_git_command(command):
    """Run a git command and return the output."""
    try:
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=True,
            shell=True,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        return f"Error: {e.stderr.strip()}"


def test_git_repository_exists():
    """Test that the .git directory exists, indicating a Git repository."""
    git_dir = Path(".git")
    assert git_dir.exists(), "Git repository (.git directory) not found"
    assert git_dir.is_dir(), ".git is not a directory"


def test_gitignore_exists():
    """Test that .gitignore file exists with appropriate content."""
    gitignore_path = Path(".gitignore")
    assert gitignore_path.exists(), ".gitignore file not found"
    
    # Check for common Python patterns in .gitignore
    gitignore_content = gitignore_path.read_text()
    expected_patterns = [
        "__pycache__/",
        "*.py[cod]",
        "*$py.class",
        "*.so",
        ".Python",
        "env/",
        "build/",
        "develop-eggs/",
        "dist/",
        "downloads/",
        "eggs/",
        ".eggs/",
        "lib/",
        "lib64/",
        "parts/",
        "sdist/",
        "var/",
        "*.egg-info/",
        ".installed.cfg",
        "*.egg",
        ".env",
        ".venv",
        "venv/",
        "ENV/",
        ".coverage",
        "htmlcov/",
        ".pytest_cache/",
    ]
    
    # Check that at least some of these patterns are in the .gitignore file
    found_patterns = 0
    for pattern in expected_patterns:
        if pattern in gitignore_content:
            found_patterns += 1
    
    # Require at least 5 common patterns to be present
    assert found_patterns >= 5, f".gitignore is missing common Python patterns, only found {found_patterns}"


def test_required_project_structure():
    """Test that the required project structure exists."""
    # Check for required directories
    required_dirs = [
        "tests",
        "docs",
        "vsc_template",  # The main package directory
    ]
    
    for dir_name in required_dirs:
        dir_path = Path(dir_name)
        assert dir_path.exists(), f"Required directory '{dir_name}' not found"
        assert dir_path.is_dir(), f"'{dir_name}' is not a directory"
    
    # Check for required files
    required_files = [
        "setup.py",
        "pyproject.toml",
        "requirements.txt",
        "README.md",
        "LICENSE",
    ]
    
    for file_name in required_files:
        file_path = Path(file_name)
        assert file_path.exists(), f"Required file '{file_name}' not found"
        assert file_path.is_file(), f"'{file_name}' is not a file"


def test_git_status():
    """Test that there are no uncommitted changes."""
    # Get git status in porcelain format for easier parsing
    status_output = run_git_command("git status --porcelain")
    
    # If the output is empty, there are no uncommitted changes
    assert status_output == "" or status_output.startswith("Error"), \
        f"There are uncommitted changes in the repository: {status_output}"


def test_git_config():
    """Test that git config is properly set up."""
    # Check for user.name and user.email
    user_name = run_git_command("git config user.name")
    user_email = run_git_command("git config user.email")
    
    assert not user_name.startswith("Error"), f"Git user.name not configured: {user_name}"
    assert not user_email.startswith("Error"), f"Git user.email not configured: {user_email}"
    
    # Check that user.name and user.email are not empty
    if not user_name.startswith("Error"):
        assert user_name, "Git user.name is empty"
    
    if not user_email.startswith("Error"):
        assert user_email, "Git user.email is empty"


def test_git_remote():
    """Test that a git remote is configured (optional)."""
    # This test is marked as optional because a local-only repository is valid
    remote_output = run_git_command("git remote -v")
    
    # Just log the remote information, don't fail if it's not set
    if remote_output and not remote_output.startswith("Error"):
        pytest.skip(f"Remote is configured: {remote_output}")
    else:
        pytest.skip("No remote configured, but this is optional")


def test_git_initial_commit():
    """Test that at least one commit exists."""
    # Try to get the first commit
    commit_output = run_git_command("git log --oneline")
    
    assert not commit_output.startswith("Error"), f"Error checking git log: {commit_output}"
    assert commit_output, "No commits found in the repository"
    
    # Count the number of commits
    commit_count = len(commit_output.splitlines())
    print(f"Found {commit_count} commits in the repository")


def test_python_specific_git_attributes():
    """Test for Python-specific git attributes (optional)."""
    gitattributes_path = Path(".gitattributes")
    
    if not gitattributes_path.exists():
        pytest.skip(".gitattributes file not found (optional)")
        return
    
    gitattributes_content = gitattributes_path.read_text()
    
    # Check for common Python-related git attributes
    expected_attributes = [
        "*.py diff=python",
        "*.pyx diff=python",
        "*.ipynb diff=jupyter",
    ]
    
    found_attributes = 0
    for attr in expected_attributes:
        if attr in gitattributes_content:
            found_attributes += 1
    
    # This is informational, not a failure
    if found_attributes == 0:
        pytest.skip("No Python-specific git attributes found (optional)")


def test_branch_naming():
    """Test that the branch follows naming conventions."""
    # Get current branch name
    branch_name = run_git_command("git rev-parse --abbrev-ref HEAD")
    
    assert not branch_name.startswith("Error"), f"Error getting branch name: {branch_name}"
    
    # Common branch names for main branches
    main_branch_names = ["main", "master", "develop", "development"]
    
    # Feature branch patterns
    feature_branch_patterns = ["feature/", "bugfix/", "hotfix/", "release/"]
    
    # Check if it's a main branch or follows feature branch pattern
    is_main_branch = branch_name in main_branch_names
    is_feature_branch = any(branch_name.startswith(pattern) for pattern in feature_branch_patterns)
    
    # This is informational, not a failure
    if not (is_main_branch or is_feature_branch):
        print(f"Branch name '{branch_name}' doesn't follow common conventions, but this is not a failure")
