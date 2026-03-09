# Use the official Jenkins agent image as the base
FROM jenkins/inbound-agent:latest

# Switch to the root user to install packages
USER root

# Install Docker
RUN curl -fsSL "https://get.docker.com/" | sh

# Add the 'jenkins' user to the 'docker' group to allow Docker access
RUN usermod -aG docker jenkins

# Create a volume for Docker's data directory
RUN mkdir -p /var/lib/docker
VOLUME /var/lib/docker

# Copy the entrypoint script into the container
COPY entrypoint.sh entrypoint.sh

# Set the entrypoint to our custom script
ENTRYPOINT ["sh", "entrypoint.sh"]
