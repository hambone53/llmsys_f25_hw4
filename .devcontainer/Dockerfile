FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install Python, development tools, and libraries
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    git \
    curl \
    wget \
    build-essential \
    ca-certificates \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3 as the default python
RUN ln -sf /usr/bin/python3 /usr/local/bin/python && \
    ln -sf /usr/bin/pip3 /usr/local/bin/pip

# Install PyTorch with CUDA 12.1
RUN pip install --no-cache-dir --trusted-host download.pytorch.org --trusted-host pypi.org --trusted-host pypi.python.org torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Create a non-root user with a home directory
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the working directory
WORKDIR /workspace

# Add nvcc to path
ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

# Verify the CUDA installation
RUN nvcc --version && \
    python -c "import torch; print('PyTorch Version:', torch.__version__); print('CUDA Available:', torch.cuda.is_available()); print('CUDA Version:', torch.version.cuda)"

# Setup permissions for mounted workspace
RUN mkdir -p /workspace && chown -R $USERNAME:$USERNAME /workspace

# Switch to the non-root user
USER $USERNAME