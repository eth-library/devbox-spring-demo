# Spring Boot Devbox Isolated Environment Demo

## Project Overview

This project is a demonstration of a simple Spring Boot application using Devbox to create an isolated development environment. The goal is to ensure that all dependencies and configurations are managed within the project, promoting consistency across different development setups.

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

#### Option 1: Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/eth-library/devbox-spring-demo.git

2. **Navigate to the Project Directory**
   ```bash
   cd devbox-spring-demo
   
3. **Switch to Devbox shell**
   ```bash
   devbox shell
   
4. **Start the webserver**
   ```bash
   mvn spring-boot:run
   
5. **Send a request to the endpoint**
   ```bash
   curl "http://localhost:8080/greeting?name=Devbox%20Tester"

#### Option 2: Using GitHub Codespaces

1. Fork this repository

2. From the **Code** dropdown, select **Create codespace on main**

3. Once the codespace has loaded, run `devbox run start` in the terminal to start the webserver.

    ```bash
    devbox run start
    ```

4. When prompted, click **Open in Browser**.

> [!TIP]
> If the popup is not visible, you can navigate to the **Forwarded Ports** tab, and open the **Forwarded Address** for port 8080.

5. **Success!** You'll see the landing page and can now curl the greeting endpoint!

## Custom Maven Settings

To maintain an isolated environment, a custom `maven.config` file is provided in the `.mvn` directory. This configuration ensures that all Maven dependencies are stored locally within the project rather than in a global repository. This approach helps to keep the development environment fully isolated, avoiding any interference from global dependencies.
