"""Additional tests for demonstration purposes."""

import pytest

from vsc_template.sample import hello


def test_hello_empty():
    """Test the hello function with an empty string."""
    assert hello("") == "Hello, "


def test_hello_numbers():
    """Test the hello function with numbers converted to string."""
    assert hello(str(123)) == "Hello, 123"


class TestHelloClass:
    """A test class to demonstrate class-based tests."""
    
    def test_hello_class_method(self):
        """Test hello function from within a test class."""
        assert hello("Class") == "Hello, Class"
    
    def test_hello_with_spaces(self):
        """Test hello function with input containing spaces."""
        assert hello("Hello World") == "Hello, Hello World"


@pytest.mark.parametrize("name,expected", [
    ("John", "Hello, John"),
    ("Jane", "Hello, Jane"),
    ("Bob", "Hello, Bob"),
])
def test_hello_parametrized(name, expected):
    """Test hello function with multiple inputs using parametrize."""
    assert hello(name) == expected
