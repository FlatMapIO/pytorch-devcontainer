## Features
- https://github.com/devcontainers/features/tree/main/src/nvidia-cuda
- https://github.com/devcontainers/features/tree/main/src/python
- Pytorch CUDA 11.8
- Homebrew (Host must be ubuntu)

## Usage

```bash

mkdir my-pytorch-project;
cd my-pytorch-project

/bin/bash -c "$(curl -fsSL https://dub.sh/pytorch-devcontainer)"


```
> Execute `./scripts/up.sh` to keep up to date


Add recipe to fish config:

Put `alias create-pytorch-devcontainer /bin/bash -c "$(curl -fsSL https://dub.sh/pytorch-devcontainer)"` 
to `~/.config/fish/config.fish`


## Build customized image

```bash
npm install -g @devcontainers/cli

# update vscode-pytorch-image.jsonc

devcontainer build \
    --workspace-folder . \
    --config .devcontainer/pytorch-devcontainer.jsonc \
    --image-name huodon/pytorch-devcontainer:dev

docker tag huodon/pytorch-devcontainer:dev huodon/pytorch-devcontainer:118
```


## TODO
- [ ] Merge [Nvidia-CUDA](https://github.com/NVIDIA/nvidia-docker/blob/main/docker/Dockerfile.deb) and [Homebrew](https://github.com/Homebrew/brew/blob/master/Dockerfile) as base image


## Links
- https://hub.docker.com/r/huodon/pytorch-devcontainer/tags
- https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
- [配置 nvidia container toolkit](./docs/ubuntu-nvidia-container.md)


