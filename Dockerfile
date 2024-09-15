# Using the official Devbox image as the base
FROM jetpackio/devbox:latest

# Set the DEVBOX_USER environment variable
ENV DEVBOX_USER=devbox-user

# Ensure we are using root to perform operations that require elevated permissions
USER root:root

# Create a new user 'devbox-user' and ensure the user has appropriate permissions on the working directory
RUN groupadd -r ${DEVBOX_USER} && \
    useradd -r -g ${DEVBOX_USER} -d /code -s /bin/bash ${DEVBOX_USER}

# Set up the working directory and permissions
WORKDIR /code
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code

# Switch to the devbox user
USER ${DEVBOX_USER}:${DEVBOX_USER}

# Copy configuration files necessary for Devbox
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json /code/devbox.json
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.lock /code/devbox.lock

# Run devbox command to install packages based on the lock file
RUN devbox run -- echo "Installed Packages."

CMD ["/bin/sh", "-c", "devbox shell && mvn spring-boot:run"]