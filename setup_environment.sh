#!/bin/bash

# Setup script for Cursor IDE development environment
# This script sets up a complete Python development environment

set -e  # Exit on error

echo "🚀 Setting up Cursor IDE development environment..."

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check Python version
python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
required_version="3.8"

if [[ $(echo "$python_version $required_version" | awk '{print ($1 >= $2)}') -eq 0 ]]; then
    echo "❌ Python $required_version or higher is required. Current version: $python_version"
    exit 1
fi

echo "✅ Python $python_version detected"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install development dependencies
echo "📚 Installing development dependencies..."
pip install -r dev-requirements.txt

# Install project dependencies
echo "📚 Installing project dependencies..."
pip install -r requirements.txt

# Install pre-commit hooks
echo "🪝 Installing pre-commit hooks..."
pre-commit install

# Create tests directory if it doesn't exist
if [ ! -d "tests" ]; then
    echo "🧪 Creating tests directory..."
    mkdir tests
    touch tests/__init__.py
    
    # Create a sample test file
    cat > tests/test_example.py << EOF
"""Example test file."""

def test_example():
    """Example test function."""
    assert True


def test_math():
    """Test basic math operations."""
    assert 2 + 2 == 4
    assert 3 * 3 == 9
EOF
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "⚙️  Creating environment file..."
    cat > .env << EOF
# Environment variables for development
PYTHONPATH=.
DEBUG=True
EOF
fi

echo ""
echo "🎉 Development environment setup complete!"
echo ""
echo "To activate the environment, run:"
echo "    source venv/bin/activate"
echo ""
echo "Available make commands:"
echo "    make help          - Show all available commands"
echo "    make format        - Format code with Black and isort"
echo "    make lint          - Run linting with Flake8"
echo "    make type-check    - Run type checking with MyPy"
echo "    make test          - Run tests with pytest"
echo "    make jupyter       - Start Jupyter Lab"
echo "    make clean         - Clean up cache files"
echo ""
echo "Keyboard shortcuts in Cursor:"
echo "    Ctrl+Shift+F       - Format code"
echo "    Ctrl+Shift+L       - Run linter"
echo "    Ctrl+Shift+T       - Type check"
echo "    Ctrl+Shift+R       - Run tests"
echo "    F5                 - Start debugging"
echo ""
echo "Happy coding! 🐍✨"