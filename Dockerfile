# Using the official Devbox image as the base
FROM jetpackio/devbox:latest

# Set the DEVBOX_USER environment variable
ENV DEVBOX_USER=devbox-user

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

CMD ["/bin/sh", "-c", "devbox shell && mvn spring-boot:run"]