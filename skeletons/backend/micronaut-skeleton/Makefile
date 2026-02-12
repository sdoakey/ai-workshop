.PHONY: help build test dev clean install package run

# Default target
.DEFAULT_GOAL := help

# Maven configuration
MVN := mvn
JAVA_VERSION := 21

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

##@ General

help: ## Display this help message
	@echo "$(CYAN)Micronaut Skeleton - Available targets:$(NC)"
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(CYAN)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

dev: ## Run application with auto-reload using exec-maven-plugin (port 8080)
	@echo "$(GREEN)Starting Micronaut development server...$(NC)"
	$(MVN) compile exec:java

build: ## Compile and package the application
	@echo "$(GREEN)Building Micronaut application...$(NC)"
	$(MVN) clean package -DskipTests
	@echo "$(GREEN)✓ Build complete! JAR in target/$(NC)"

test: ## Run unit tests with JUnit Jupiter
	@echo "$(GREEN)Running Micronaut tests...$(NC)"
	$(MVN) test
	@echo "$(GREEN)✓ Tests complete$(NC)"

##@ Utilities

install: ## Download dependencies and install to local Maven repository
	@echo "$(GREEN)Installing Maven dependencies...$(NC)"
	$(MVN) dependency:resolve
	@echo "$(GREEN)✓ Dependencies installed$(NC)"

clean: ## Remove build artifacts
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	$(MVN) clean
	@echo "$(GREEN)✓ Clean complete$(NC)"

package: ## Create executable JAR
	@echo "$(GREEN)Packaging application...$(NC)"
	$(MVN) package
	@echo "$(GREEN)✓ Package created in target/$(NC)"

run: build ## Build and run the application
	@echo "$(GREEN)Running application...$(NC)"
	java -jar target/skeleton-0.0.1-SNAPSHOT.jar

##@ Docker

docker-build: ## Build Docker image
	@echo "$(GREEN)Building Docker image...$(NC)"
	docker build -t micronaut-skeleton .
	@echo "$(GREEN)✓ Docker image built$(NC)"

docker-run: ## Run application in Docker container
	@echo "$(GREEN)Starting Docker container...$(NC)"
	docker compose up -d
	@echo "$(GREEN)✓ Container running at http://localhost:8080$(NC)"

docker-stop: ## Stop Docker container
	@echo "$(YELLOW)Stopping Docker container...$(NC)"
	docker compose down
	@echo "$(GREEN)✓ Container stopped$(NC)"

docker-logs: ## View Docker container logs
	docker compose logs -f
