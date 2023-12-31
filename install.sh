#!/bin/bash

IMAGE=huodon/pytorch-devcontainer:118

DOCKER=`which docker`

# if docker exists, execute docker pull
if [ -n "$DOCKER" ]; then
  read -p "Pull $IMAGE? [y/N] " confirm
  if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    echo "Pulling $IMAGE..."
    $DOCKER pull $IMAGE
  fi
fi

ensure_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}

BASE_URL=https://raw.githubusercontent.com/FlatMapIO/pytorch-devcontainer/main

install() {
  echo "Installing..."
  ensure_dir ".devcontainer"
  ensure_dir scripts
  ensure_dir docker


  curl -sL $BASE_URL/.devcontainer/devcontainer.example.json > ./.devcontainer/devcontainer.json
  if ! [ -f  ./.devcontainer/update.sh ]; then
    curl -sL $BASE_URL/.devcontainer/update.fish > ./.devcontainer/update.fish
  fi
  curl -sL $BASE_URL/.devcontainer/up.sh > ./.devcontainer/up.sh; chmod +x ./.devcontainer/up.sh
  curl -sL $BASE_URL/scripts/dev-info.fish > scripts/dev-info.fish; chmod +x ./scripts/dev-info.fish
  curl -sL $BASE_URL/scripts/shell.fish > scripts/shell.fish; chmod +x ./scripts/shell.fish
  curl -sL $BASE_URL/scripts/prune-container.fish > scripts/prune-container.fish; chmod +x ./scripts/prune-container.fish
  curl -sL $BASE_URL/docker/Dockerfile > docker/Dockerfile
  curl -sL $BASE_URL/docker-compose.yml > docker-compose.yml
}

# 检查是否有.devcontainer目录
if [ -d ".devcontainer" ]; then
  read -p "Detected .devcontainer directory. Update? [Y/n] " confirm
  if [ "$confirm" = "" ] || [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
    install
  else
    echo "Skipping update"
  fi
else
  install
fi


