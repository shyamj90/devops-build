#!/bin/bash
set -e

IMAGE_NAME="shyamj90"
BRANCH_NAME=$1
BRANCH_NAME="${BRANCH_NAME#origin/}"


if [ "$BRANCH_NAME" == "dev" ]; then
  echo "Deploying to DEV repo..."
  docker push ${IMAGE_NAME}/${BRANCH_NAME}
elif [ "$BRANCH_NAME" == "main" ]; then
  echo "Deploying to PROD repo..."
  docker push ${IMAGE_NAME}/prod
else
  echo "Branch $BRANCH_NAME does not trigger deployment."
fi
