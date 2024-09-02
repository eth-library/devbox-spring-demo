# Spring Boot Devbox Isolated Environment Demo

## Project Overview

This project is a demonstration of a simple Spring Boot application using Devbox to create an isolated development environment. The goal is to ensure that all dependencies and configurations are managed within the project, promoting reproducibility and consistency across different development setups.

## Technology Stack

- **Spring Boot Version**: `3.3.3`
- **Java Version**: `22`

## Dependencies

The project includes the following dependencies:

- **Spring Boot Starter Web**: For serving the web application, including RESTful services.
- **Spring Boot Starter Test**: For unit testing with Spring Boot.

## Building and Running the Project

### Prerequisites

Ensure that you have Devbox installed and configured. Devbox manages the dependencies and environment configurations.

### Steps to Run

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd devbox-spring-demo
   devbox shell

## Custom Maven Settings

To maintain an isolated environment, a custom `maven.config` file is provided in the `.mvn` directory. This configuration ensures that all Maven dependencies are stored locally within the project rather than in a global repository. This approach helps to keep the development environment fully isolated and reproducible, avoiding any interference from global dependencies.
