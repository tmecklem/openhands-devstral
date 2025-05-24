#!/bin/bash

# Default model name (can be overridden with environment variable)
MODEL_NAME=${MODEL_NAME:-"bullerwins/Devstral-Small-2505-fp8"}
MODEL_DIR=${MODEL_DIR:-"./models"}

echo "Creating model directory if it doesn't exist..."
mkdir -p $MODEL_DIR

echo "Downloading model: $MODEL_NAME to $MODEL_DIR"
# Install huggingface_hub if not already installed
pip install -q huggingface_hub

# Use huggingface_hub to download the model
python -c "
from huggingface_hub import snapshot_download
import os

model_name = os.environ.get('MODEL_NAME', '$MODEL_NAME')
model_dir = os.environ.get('MODEL_DIR', '$MODEL_DIR')

print(f'Downloading model {model_name} to {model_dir}...')
snapshot_download(
    repo_id=model_name,
    local_dir=model_dir,
    local_dir_use_symlinks=False
)
print('Download complete!')
"

echo "Model download completed. Files are in $MODEL_DIR" 