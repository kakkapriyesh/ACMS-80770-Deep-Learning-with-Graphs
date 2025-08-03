# Cursor IDE Development Environment

A comprehensive Python development environment setup for Cursor IDE, optimized for deep learning with graphs and scientific computing.

## 🚀 Quick Start

1. **Automatic Setup** (Recommended):
   ```bash
   ./setup_environment.sh
   ```

2. **Manual Setup**:
   ```bash
   # Create virtual environment
   python3 -m venv venv
   source venv/bin/activate
   
   # Install dependencies
   pip install -r dev-requirements.txt
   pip install -r requirements.txt
   
   # Setup pre-commit hooks
   pre-commit install
   ```

## 📁 Project Structure

```
.
├── .vscode/                    # VS Code/Cursor configuration
│   ├── settings.json          # IDE settings
│   ├── extensions.json        # Recommended extensions
│   ├── launch.json           # Debug configurations
│   ├── tasks.json            # Task definitions
│   ├── keybindings.json      # Custom keyboard shortcuts
│   └── snippets.json         # Code snippets
├── Projects/                  # Your projects
├── Homework*/                 # Course assignments
├── Lecture*/                  # Course materials
├── tests/                     # Test files
├── venv/                      # Virtual environment (created after setup)
├── requirements.txt           # Project dependencies
├── dev-requirements.txt       # Development dependencies
├── pyproject.toml            # Modern Python configuration
├── .flake8                   # Linting configuration
├── .pre-commit-config.yaml   # Git hooks configuration
├── Makefile                  # Development commands
└── setup_environment.sh      # Environment setup script
```

## 🛠️ Features

### Code Quality Tools
- **Black**: Code formatting (88 character line length)
- **isort**: Import sorting
- **Flake8**: Linting and style checking
- **MyPy**: Static type checking
- **Pylint**: Advanced code analysis

### Development Tools
- **Pytest**: Testing framework with coverage
- **Pre-commit**: Git hooks for code quality
- **Jupyter**: Interactive development
- **IPython**: Enhanced Python shell

### IDE Configuration
- **IntelliSense**: Smart code completion
- **Debugging**: Full debugging support
- **Task Runner**: Integrated development tasks
- **Git Integration**: Enhanced git workflow
- **Custom Shortcuts**: Productivity shortcuts

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F` | Format code with Black |
| `Ctrl+Shift+L` | Run Flake8 linter |
| `Ctrl+Shift+T` | Type check with MyPy |
| `Ctrl+Shift+R` | Run tests |
| `Ctrl+Shift+I` | Install requirements |
| `Ctrl+Shift+J` | Run all Jupyter cells |
| `Ctrl+Shift+K` | Run current Jupyter cell |
| `F5` | Start debugging |
| `Ctrl+F5` | Run without debugging |

## 🔧 Make Commands

```bash
make help          # Show all available commands
make setup         # Set up virtual environment
make dev-setup     # Complete development setup
make install       # Install production dependencies
make install-dev   # Install development dependencies
make format        # Format code (Black + isort)
make lint          # Run linting (Flake8)
make type-check    # Run type checking (MyPy)
make test          # Run tests with coverage
make test-watch    # Run tests in watch mode
make clean         # Clean cache files
make check         # Run all checks
make ci            # Run CI checks
make jupyter       # Start Jupyter Lab
make notebook      # Start Jupyter Notebook
make pre-commit    # Run pre-commit hooks
```

## 📦 Installed Packages

### Core Scientific Computing
- **NumPy**: Numerical computing
- **SciPy**: Scientific computing
- **Pandas**: Data analysis
- **Matplotlib**: Plotting
- **Seaborn**: Statistical visualization

### Machine Learning
- **PyTorch**: Deep learning framework
- **Scikit-learn**: Machine learning library
- **PyTorch Geometric**: Graph neural networks
- **DGL**: Deep Graph Library
- **Spektral**: Graph neural networks for Keras

### Graph Analysis
- **NetworkX**: Network analysis
- **Graph-tool**: High-performance graph analysis
- **PyGraphviz**: Graph visualization
- **Python-igraph**: Graph analysis library

### Chemistry/Physics (from your projects)
- **Cantera**: Chemical kinetics and thermodynamics
- **Chainer Chemistry**: Chemistry with deep learning

### Development Tools
- **Black**: Code formatter
- **isort**: Import sorter
- **Flake8**: Linter
- **MyPy**: Type checker
- **Pytest**: Testing framework
- **Pre-commit**: Git hooks
- **Jupyter**: Interactive notebooks

## 🐞 Debugging

The IDE is configured with multiple debug configurations:

1. **Current File**: Debug the currently open Python file
2. **Module**: Debug a Python module
3. **Django**: Debug Django applications
4. **Flask**: Debug Flask applications
5. **Pytest**: Debug tests
6. **Jupyter**: Debug Jupyter notebooks

## 🧪 Testing

### Running Tests
```bash
# Run all tests
make test

# Run specific test file
pytest tests/test_example.py

# Run with coverage
pytest --cov=. --cov-report=html

# Run in watch mode
make test-watch
```

### Test Structure
```python
def test_function_name():
    """Test description."""
    # Arrange
    input_data = "test"
    
    # Act
    result = function_under_test(input_data)
    
    # Assert
    assert result == expected_result
```

## 📝 Code Snippets

Type these prefixes and press Tab:

- `class` → Python class with docstrings
- `def` → Function with type hints and docstring
- `main` → Main function pattern
- `test` → Test function with AAA pattern
- `try` → Try-except block
- `dataclass` → Dataclass definition

## 🔍 Linting Configuration

The setup includes comprehensive linting rules:

- **Line length**: 88 characters (Black standard)
- **Import sorting**: Automatic with isort
- **Type checking**: Basic mode with MyPy
- **Code complexity**: Maximum complexity of 10
- **Documentation**: Docstring requirements

## 🎯 Git Hooks

Pre-commit hooks automatically run on each commit:

- Remove trailing whitespace
- Fix end-of-file issues
- Check YAML syntax
- Check for large files
- Check for merge conflicts
- Remove debug statements
- Format code with Black
- Sort imports with isort
- Lint with Flake8
- Type check with MyPy

## 🔧 Customization

### Adding New Dependencies
1. Add to `requirements.txt` or `dev-requirements.txt`
2. Run `make install` or `make install-dev`

### Modifying Code Style
1. Edit `pyproject.toml` for Black/isort settings
2. Edit `.flake8` for linting rules
3. Edit `.vscode/settings.json` for IDE behavior

### Adding New Tasks
1. Edit `.vscode/tasks.json` for IDE tasks
2. Edit `Makefile` for command-line tasks

## 🚨 Troubleshooting

### Common Issues

1. **Import errors**: Make sure virtual environment is activated
2. **Linting failures**: Run `make format` to fix formatting issues
3. **Test failures**: Check test configuration in `pyproject.toml`
4. **Missing dependencies**: Run `make install-dev`

### Reset Environment
```bash
# Clean and reinstall
make clean
rm -rf venv
./setup_environment.sh
```

## 📚 Learning Resources

- [Black Documentation](https://black.readthedocs.io/)
- [Flake8 Rules](https://flake8.pycqa.org/en/latest/user/error-codes.html)
- [MyPy Documentation](https://mypy.readthedocs.io/)
- [Pytest Documentation](https://docs.pytest.org/)
- [Pre-commit Hooks](https://pre-commit.com/hooks.html)

## 🤝 Contributing

1. Follow the established code style (enforced by tools)
2. Write tests for new functionality
3. Update documentation as needed
4. Ensure all checks pass: `make check`

## 📄 License

This development environment setup is provided as-is for educational purposes.

---

**Happy coding with Cursor! 🎉**