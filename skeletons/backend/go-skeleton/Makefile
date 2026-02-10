.PHONY: help build test dev clean install lint format run

# Default target
.DEFAULT_GOAL := help

# Go configuration
GO := go
BINARY := server
CMD_DIR := ./cmd/server

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

##@ General

help: ## Display this help message
	@echo "$(CYAN)Go Skeleton - Available targets:$(NC)"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(CYAN)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

dev: ## Run development server (port 8080)
	@echo "$(GREEN)Starting Go development server...$(NC)"
	$(GO) run $(CMD_DIR)

build: ## Compile the application binary
	@echo "$(GREEN)Building Go application...$(NC)"
	$(GO) build -o $(BINARY) $(CMD_DIR)
	@echo "$(GREEN)✓ Build complete! Binary: ./$(BINARY)$(NC)"

test: ## Run tests
	@echo "$(GREEN)Running Go tests...$(NC)"
	$(GO) test ./... -v
	@echo "$(GREEN)✓ Tests complete$(NC)"

run: build ## Build and run the application
	@echo "$(GREEN)Running Go application...$(NC)"
	./$(BINARY)

##@ Utilities

install: ## Download Go module dependencies
	@echo "$(GREEN)Downloading Go dependencies...$(NC)"
	$(GO) mod download
	@echo "$(GREEN)✓ Dependencies installed$(NC)"

clean: ## Remove build artifacts
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	rm -f $(BINARY)
	$(GO) clean
	@echo "$(GREEN)✓ Clean complete$(NC)"

lint: ## Run Go vet for static analysis
	@echo "$(GREEN)Running Go vet...$(NC)"
	$(GO) vet ./...
	@echo "$(GREEN)✓ Vet passed$(NC)"

format: ## Format Go source code
	@echo "$(GREEN)Formatting Go code...$(NC)"
	$(GO) fmt ./...
	@echo "$(GREEN)✓ Formatting complete$(NC)"

tidy: ## Tidy and verify Go module dependencies
	@echo "$(GREEN)Tidying Go modules...$(NC)"
	$(GO) mod tidy
	@echo "$(GREEN)✓ Modules tidied$(NC)"
