# Use Ubuntu as the base image
FROM ubuntu:24.04

# Update package list and install essential tools (curl, ca-certificates)
RUN apt-get update && \
    # Install packages without prompts and recommendations
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl \
    ca-certificates && \
    # Clean up apt cache to reduce image size
    apt-get clean && \
    # Delete downloaded package lists
    rm -rf /var/lib/apt/lists/*

# Install Nix Package Manager using the Determinate Systems Nix installer
RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  --init none \
  --no-confirm

# Set PATH environment variable to include Nix binaries
ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"

# Launch systemd
CMD [ "/bin/systemd" ]

# Install Devbox using Nix
RUN nix profile install nixpkgs#devbox

# Create non-root user and group
RUN groupadd -g 1001 devbox && \
    useradd -g 1001 -u 1001 devbox

# Switch to non-root user
USER devbox