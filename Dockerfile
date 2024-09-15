# Using the official Devbox image as the base
FROM jetpackio/devbox:latest

# Set up the working directory and permissions
WORKDIR /code
USER root:root
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code

# Switch to the devbox user
USER ${DEVBOX_USER}:${DEVBOX_USER}

# Copy configuration files necessary for Devbox
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json /code/devbox.json
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.lock /code/devbox.lock

# Run devbox command to install packages based on the lock file
RUN devbox run -- echo "Installed Packages."

# Clone the specific repository and change directory into it
RUN git clone https://github.com/eth-library/devbox-spring-demo.git /code/devbox-spring-demo
WORKDIR /code/devbox-spring-demo

# Set the default command to open devbox shell and run the Spring Boot application
CMD ["sh", "-c", ". ~/.devbox/shell && mvn spring-boot:run"]