# Use Ubuntu Jammy
FROM ubuntu:jammy

# Install wine, then remove apt packages list
RUN apt-get update && apt-get install -y wine
RUN rm -rf /var/lib/apt/lists/*

# Wine init, otherwise re-init everytime you run "docker run"
RUN winecfg

# Active directory
WORKDIR /app

# Run notepad
ENTRYPOINT [ "wine64", "notepad" ]