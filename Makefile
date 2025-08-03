.PHONY: help install install-dev format lint type-check test clean setup dev-setup

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## Install production dependencies
	pip install -r requirements.txt

install-dev:  ## Install development dependencies
	pip install -r dev-requirements.txt
	pip install -r requirements.txt

setup:  ## Set up the development environment
	python3 -m venv venv
	@echo "Activate virtual environment with: source venv/bin/activate"

dev-setup: setup install-dev  ## Complete development setup
	pre-commit install
	@echo "Development environment is ready!"

format:  ## Format code with black and isort
	black .
	isort .

lint:  ## Run linting with flake8
	flake8 .

type-check:  ## Run type checking with mypy
	mypy .

test:  ## Run tests with pytest
	pytest tests/ -v --cov=. --cov-report=term-missing

test-watch:  ## Run tests in watch mode
	pytest-watch tests/

clean:  ## Clean up cache files and build artifacts
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf build/
	rm -rf dist/

check: format lint type-check test  ## Run all checks (format, lint, type-check, test)

ci: lint type-check test  ## Run CI checks (without formatting)

jupyter:  ## Start Jupyter Lab
	jupyter lab

notebook:  ## Start Jupyter Notebook
	jupyter notebook

pre-commit:  ## Run pre-commit hooks on all files
	pre-commit run --all-files