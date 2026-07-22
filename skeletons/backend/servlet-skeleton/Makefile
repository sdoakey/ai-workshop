.PHONY: help dev build test install clean run

.DEFAULT_GOAL := help

MVN := mvn
PORT ?= 8080

CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m

##@ General

help: ## Display this help message
	@echo "$(CYAN)Servlet Skeleton - Available targets:$(NC)"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(CYAN)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

dev: install ## Run development server with hot reload (port 8080)
	@echo "$(GREEN)Starting Servlet development server on port $(PORT)...$(NC)"
	PORT=$(PORT) $(MVN) jetty:run

build: install ## Compile and package WAR
	@echo "$(GREEN)Building Servlet application...$(NC)"
	$(MVN) clean package -DskipTests
	@echo "$(GREEN)✓ Build complete! WAR in target/$(NC)"

test: install ## Run tests (note: no test framework configured yet)
	@echo "$(YELLOW)⚠ No test framework configured for this project$(NC)"
	@echo "$(YELLOW)To add tests, consider JUnit 5 with Maven Surefire.$(NC)"
	@exit 1

run: build ## Run packaged application in embedded Jetty
	@echo "$(GREEN)Running Servlet application from packaged WAR...$(NC)"
	PORT=$(PORT) $(MVN) jetty:run-war

##@ Utilities

install: ## Download Maven dependencies
	@echo "$(GREEN)Resolving Maven dependencies...$(NC)"
	$(MVN) dependency:resolve
	@echo "$(GREEN)✓ Dependencies resolved$(NC)"

clean: ## Remove build artifacts
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	$(MVN) clean
	@echo "$(GREEN)✓ Clean complete$(NC)"
