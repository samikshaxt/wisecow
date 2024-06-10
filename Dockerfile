# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Copy the Wisecow script to the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port that the service listens on
EXPOSE 4499

# Define the command to run when the container starts
CMD ["/usr/local/bin/wisecow.sh"]

