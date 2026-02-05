# AI-Powered Development Workshop

## Overview

Welcome to the AI-Powered Development Workshop! This hands-on workshop challenges you to build complete, production-ready applications from scratch using AI-assisted development tools like GitHub Copilot. You'll select from a range of projects across different complexity levels and demonstrate your ability to leverage AI to accelerate development while maintaining code quality, security, and best practices.

## Workshop Goals

- **Master AI-Assisted Development**: Learn to effectively use GitHub Copilot and other AI tools to accelerate software development
- **Build Production-Ready Applications**: Create fully functional applications that meet professional standards
- **Implement Best Practices**: Apply security, testing, containerization, and deployment best practices
- **Develop From Scratch**: Build everything from the ground up - no templates, no shortcuts
- **Demonstrate Containerization**: Package applications as Docker containers with proper orchestration

## Pre-requisites

Before starting the workshop, ensure you have the following installed and configured:

### Development Environment
- **Developer laptop** with WSL (Windows Subsystem for Linux) installed
- **Node.js and NPM** (for JavaScript/TypeScript projects)
- **Python 3.x** (for Python projects)
- **JDK** (Java Development Kit for Java projects)
- **Docker** and Docker Compose
- **Visual Studio Code** with recommended extensions
- **Git** commit early and often!

### Access Requirements
- **GitHub account** with access to the cse-cst project
- **GitHub Copilot Business Seat** through cse-cst organization

## Universal Success Criteria

Every project, regardless of difficulty level, must meet these mandatory criteria:

### ✅ Functional Requirements
- **All acceptance criteria met** - Every user story in your chosen requirement must be fully implemented
- **Complete functionality** - The application must work end-to-end with no missing features

### ✅ Containerization
- **Docker containers** - All application components packaged as Docker containers
- **docker-compose.yml** - Single command to run the entire application stack
- **Proper configuration** - Environment variables, networking, and volumes configured correctly
- **Documentation** - Clear instructions for building and running containers

### ✅ Quality Standards
- **Testing** - Unit tests, integration tests, and other tests as specified in acceptance criteria
- **Security** - Input validation, sanitization, prevention of common vulnerabilities (SQL injection, XSS, etc.)
- **Error handling** - Graceful error handling and appropriate user feedback
- **Code quality** - Clean, maintainable code following language-specific best practices

### ✅ Documentation
- **README** - How to set up, run, and test the application
- **API documentation** - If applicable, document endpoints and contracts
- **Database schema** - If applicable, document data models

## Technology Stack

You have **complete freedom** to choose your technology stack:

- **Languages**: JavaScript/TypeScript, Python, Java, Go, or any language you prefer
- **Frameworks**: React, Vue, Angular, Express, Flask, Django, Spring Boot, .NET, etc.
- **Databases**: PostgreSQL, MySQL, MongoDB, Redis, etc.
- **Additional tools**: Any libraries, frameworks, or tools that help you succeed

## Project Difficulty Levels

### 🟢 Easy (Beginner-Friendly)
Perfect for getting started with AI-assisted development. These projects have simpler requirements and fewer user stories.

### 🟡 Medium (Intermediate)
More complex applications with multiple user roles, authentication, and advanced features.

### 🔴 Hard (Advanced)
Enterprise-grade applications with complex architectures, real-time features, compliance requirements, and scalability considerations.


## Getting Started

1. **Choose Your Project**: Select one project from any difficulty level that matches your skill level and interests
2. **Review Requirements**: Read the detailed requirement document in the `requirements/` folder
3. **Plan Your Approach**: Identify user stories, prioritize features, and plan your architecture
4. **Set Up Environment**: Configure your development environment and tools
5. **Build with AI**: Use GitHub Copilot to accelerate development while maintaining quality
6. **Test Thoroughly**: Implement all required tests from acceptance criteria
7. **Containerize**: Package your application in Docker containers
8. **Document**: Create clear documentation for setup and usage
9. **Demo**: Present your working application

## Tips for Success

### Leverage AI Effectively
- Write clear, descriptive comments to guide Copilot
- Break down complex tasks into smaller, manageable pieces
- Review and understand AI-generated code
- Use Copilot for boilerplate, tests, and documentation

### Focus on Quality
- Don't skip testing - it's in the acceptance criteria
- Implement security best practices from the start
- Handle errors gracefully
- Write clean, maintainable code

### Containerization Best Practices
- Use multi-stage builds to minimize image size
- Set appropriate environment variables
- Use volumes for persistent data
- Document port mappings and networking

### Time Management
- Start with core functionality
- Implement user stories in priority order
- Test incrementally as you build
- Leave time for containerization and documentation

## Support and Resources

- **Requirement Documents**: Detailed specifications in `requirements/` folder
- **GitHub Copilot**: Your primary development assistant
- **Peers**: Collaborate and share knowledge with other participants
- **Documentation**: Leverage official docs for chosen technologies

---

## Important Notes

⚠️ **Build Everything From Scratch**: No templates, starter kits, or pre-built solutions allowed. This is an exercise in building complete applications with AI assistance.

⚠️ **All Acceptance Criteria Are Mandatory**: Every checkbox in your chosen requirement must be satisfied. Don't skip security, testing, or logging requirements.

⚠️ **Containerization Is Required**: Your application must run via `docker-compose up` with no additional setup steps.

---

Good luck, and happy building! Remember, the goal is not just to complete a project, but to demonstrate mastery of AI-assisted development while maintaining professional standards.
