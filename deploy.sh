#!/bin/bash

# Variables
REPO_URL="https://github.com/CEP-Comwell/devops_pull.git"  # Git repository URL
WORKDIR="$HOME/edgesec.ca"  # Parent directory for the repository
INVENTORY_FILE="hosts.ini"  # Inventory file for ansible-pull

# Update package repositories
echo "Updating package repositories..."
sudo apt-get update -y

# Install required packages
echo "Installing Ansible, Git, and Python3..."
sudo apt-get install -y ansible git python3

# Create the parent directory
if [ ! -d "$WORKDIR" ]; then
    echo "Creating parent directory at $WORKDIR..."
    mkdir -p "$WORKDIR"
else
    echo "Parent directory $WORKDIR already exists."
fi

# Change to the parent directory
cd "$WORKDIR" || exit

# Run ansible-pull
echo "Running ansible-pull..."
sudo ansible-pull -i "$INVENTORY_FILE" -U "$REPO_URL"

echo "Deployment completed."
