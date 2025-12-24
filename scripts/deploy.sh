#!/bin/bash
set -e

# Secure Transfer the manifests and configs to the App server
scp -o StrictHostKeyChecking=no docker-compose.yaml prometheus.yml blackbox.yml ec2-user@172.31.35.56:/home/ec2-user/app/
# SSH connection
ssh -o StrictHostKeyChecking=no ec2-user@172.31.35.56 

cd /home/ec2-user/app && docker compose up -d
