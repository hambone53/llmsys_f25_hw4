#!/bin/bash
set -e

echo "===== Step 1: Installing Requirements ====="
pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.extra.txt
pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

echo "===== Step 2: Installing miniTorch in editable mode ====="
pip install -e .

echo "===== Step 3: Checking CUDA Installation ====="
nvcc --version
nvidia-smi

echo "===== Step 4: Verifying PyTorch CUDA Setup ====="
python -c "import torch; print('PyTorch Version:', torch.__version__); print('CUDA Available:', torch.cuda.is_available()); print('CUDA Version:', torch.version.cuda)"

echo "===== Step 5: Compiling CUDA Kernels ====="
bash compile_cuda.sh

echo "===== Installation Completed ====="
echo "Your development environment is now set up!"