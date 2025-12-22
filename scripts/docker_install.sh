#!/bin/bash
# Install Docker and Docker Compose v2

set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing Docker..."
sudo yum install -y docker

echo "Starting and enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding ec2-user and jenkins to docker group..."
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins

echo "Downloading Docker Compose v2 plugin..."
sudo mkdir -p /usr/libexec/docker/cli-plugins
sudo curl -SL "https://github.com/docker/compose/releases/download/v2.40.2/docker-compose-linux-x86_64" \
  -o /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

echo "Verifying installation..."
docker --version
docker compose version

echo "Installation complete."
