FROM huodon/pytorch-devcontainer:118

USER vscode

ENV PATH=:/home/vscode/.local/bin:$PATH

WORKDIR /app

# resolve opencv dependency issue
# https://www.cnblogs.com/niuben/p/17587591.html
RUN sudo apt update; \
  sudo apt install -y libgl1-mesa-glx; \
  sudo rm -rf /var/lib/apt/lists/*


# ComfyUI
# RUN -mount=type=cache,target=/vscode/.cache/pip,rw \
#   pip install --no-cache-dir -r \
#   https://raw.githubusercontent.com/comfyanonymous/ComfyUI/master/requirements.txt