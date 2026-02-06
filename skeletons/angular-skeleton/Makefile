.PHONY: help build test dev clean install lint serve

# Default target
.DEFAULT_GOAL := help

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

##@ General

help: ## Display this help message
	@echo "$(CYAN)Angular Skeleton - Available targets:$(NC)"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(CYAN)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

dev: install ## Run development server with live reload (port 4200)
	@echo "$(GREEN)Starting Angular development server...$(NC)"
	npm run start

build: install ## Build production bundle
	@echo "$(GREEN)Building Angular application...$(NC)"
	npm run build
	@echo "$(GREEN)✓ Build complete! Output in dist/$(NC)"

test: install ## Run unit tests with Karma
	@echo "$(GREEN)Running Angular unit tests...$(NC)"
	npm run test -- --no-watch --browsers=ChromeHeadless

##@ Utilities

install: node_modules ## Install dependencies

node_modules: package.json package-lock.json
	@echo "$(GREEN)Installing npm dependencies...$(NC)"
	npm install
	@touch node_modules

clean: ## Remove build artifacts and dependencies
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	rm -rf dist node_modules .angular
	@echo "$(GREEN)✓ Clean complete$(NC)"

lint: install ## Run linting (if configured)
	@echo "$(YELLOW)Note: Linting not configured. Add ESLint with:$(NC)"
	@echo "  ng add @angular-eslint/schematics"

watch: install ## Build in watch mode for development
	@echo "$(GREEN)Starting build watcher...$(NC)"
	npm run watch
