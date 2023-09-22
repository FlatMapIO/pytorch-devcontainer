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

  curl -sL $BASE_URL/.devcontainer/devcontainer.example.json > ./.devcontainer/devcontainer.json
  if ! [ -f  ./.devcontainer/update.sh ]; then
    curl -sL $BASE_URL/.devcontainer/update.sh > ./.devcontainer/update.sh; chmod +x ./.devcontainer/update.sh
  fi
  curl -sL $BASE_URL/scripts/env-info.py > scripts/env-info.py
  curl -sL $BASE_URL/scripts/up.sh > scripts/up.sh; chmod +x scripts/up.sh
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

