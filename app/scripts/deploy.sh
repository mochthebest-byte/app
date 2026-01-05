#!/usr/bin/env bash
set -e

APP_NAME="myapp"
IMAGE="ghcr.io/<github-username>/<repo-name>"
PORT="8080"

if [ -z "$1" ]; then
  echo "Usage: ./deploy.sh <image-tag>"
  exit 1
fi

TAG="$1"

echo "Deploying $IMAGE:$TAG"

docker pull "$IMAGE:$TAG"

docker stop "$APP_NAME" || true
docker rm "$APP_NAME" || true

docker run -d \
  --name "$APP_NAME" \
  -p "$PORT:5000" \
  --restart unless-stopped \
  "$IMAGE:$TAG"

echo "Deployment finished"
