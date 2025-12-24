#!/bin/bash
set -e

IMAGE_NAME="shyamj90"
BRANCH_NAME=$1
BRANCH_NAME="${BRANCH_NAME#origin/}"
echo "Building Docker image for branch: $BRANCH_NAME"
docker build -t ${IMAGE_NAME}/${BRANCH_NAME} .
