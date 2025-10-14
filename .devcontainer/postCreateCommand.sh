#!/bin/bash

# This script ensures the setup.sh script is executable in the container
chmod +x /workspaces/llmsys_f25_hw4/.devcontainer/setup.sh
echo "Setup script is now executable. Run it with: ./.devcontainer/setup.sh"