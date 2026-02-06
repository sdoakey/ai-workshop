.PHONY: help build test dev clean install lint format

# Default target
.DEFAULT_GOAL := help

# Python configuration
PYTHON := python3
VENV := venv
BIN := $(VENV)/bin
PYTHON_VENV := $(BIN)/python
PIP := $(BIN)/pip

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

##@ General

help: ## Display this help message
	@echo "$(CYAN)FastAPI Skeleton - Available targets:$(NC)"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(CYAN)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

dev: install ## Run development server with auto-reload (port 8000)
	@echo "$(GREEN)Starting FastAPI development server...$(NC)"
	$(BIN)/uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

build: install lint ## Verify application builds (install deps + run checks)
	@echo "$(GREEN)Building FastAPI application...$(NC)"
	@echo "$(GREEN)✓ Verifying Python syntax...$(NC)"
	@$(PYTHON_VENV) -m py_compile app/main.py app/__init__.py
	@echo "$(GREEN)✓ All dependencies installed$(NC)"
	@echo "$(GREEN)✓ Build verification complete$(NC)"

test: install ## Run tests (note: no test framework configured yet)
	@echo "$(YELLOW)⚠ No test framework configured for this project$(NC)"
	@echo "$(YELLOW)To add tests, consider installing pytest:$(NC)"
	@echo "  echo 'pytest>=7.4.0' >> requirements.txt"
	@echo "  echo 'httpx>=0.24.0' >> requirements.txt  # For testing FastAPI"
	@echo "  $(MAKE) install"
	@echo "  mkdir -p tests && touch tests/__init__.py"
	@exit 1

##@ Utilities

install: $(VENV) ## Install Python dependencies

$(VENV): requirements.txt
	@echo "$(GREEN)Creating virtual environment...$(NC)"
	$(PYTHON) -m venv $(VENV)
	@echo "$(GREEN)Installing dependencies...$(NC)"
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	@touch $(VENV)

clean: ## Remove virtual environment and cache files
	@echo "$(YELLOW)Cleaning virtual environment and cache...$(NC)"
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	@echo "$(GREEN)✓ Clean complete$(NC)"

lint: install ## Run basic linting
	@echo "$(GREEN)Checking Python syntax...$(NC)"
	@$(PYTHON_VENV) -m py_compile app/main.py app/__init__.py
	@echo "$(GREEN)✓ Syntax check passed$(NC)"

format: install ## Format code with black (if installed)
	@if [ -f "$(BIN)/black" ]; then \
		echo "$(GREEN)Formatting code with black...$(NC)"; \
		$(BIN)/black app/; \
	else \
		echo "$(YELLOW)black not installed. Install with: pip install black$(NC)"; \
	fi

requirements: ## Generate requirements.txt from current environment
	@$(PIP) freeze > requirements.txt
	@echo "$(GREEN)✓ requirements.txt updated$(NC)"
