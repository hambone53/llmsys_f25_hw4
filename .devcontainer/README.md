# Development Container for LLMSYS HW3

This devcontainer setup provides a complete environment for working on the LLMSYS HW3 assignment.

## Features

- CUDA 12.1 with compatible PyTorch installation
- All required Python dependencies
- Automated setup for compiling CUDA kernels
- GPU support

## Getting Started

1. Open this project in VS Code
2. When prompted, click "Reopen in Container"
3. Once the container is built and started, run the setup script:

   ```bash
   ./.devcontainer/setup.sh
   ```

4. This script will:
   - Install all required dependencies
   - Install miniTorch in editable mode
   - Verify CUDA and PyTorch installation
   - Compile CUDA kernels

## Manual Installation Steps

If you prefer to run the installation steps manually, follow these steps inside the container:

1. Install requirements:

   ```bash
   pip install -r requirements.extra.txt
   pip install -r requirements.txt
   ```

2. Install miniTorch in editable mode:

   ```bash
   pip install -e .
   ```

3. Compile CUDA kernels:

   ```bash
   bash compile_cuda.sh
   ```

## Troubleshooting

If you encounter CUDA-related issues:

1. Verify CUDA installation:

   ```bash
   nvcc --version
   nvidia-smi
   ```

2. Check PyTorch CUDA compatibility:

   ```python
   import torch
   print("PyTorch Version:", torch.__version__)
   print("CUDA Available:", torch.cuda.is_available())
   print("CUDA Version:", torch.version.cuda)
   ```

3. Make sure your host system has compatible NVIDIA drivers installed