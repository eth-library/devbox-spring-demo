# Use Ubuntu as the base image
FROM ubuntu:24.04

# Install most essential tools (curl and ca-certificates)
RUN apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates \
    --no-install-recommends && \
    apt-get clean && \
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