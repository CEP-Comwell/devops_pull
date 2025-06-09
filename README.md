# devops_pull Ansible-pull script for DevOps endpoints

# Run apt update

sudo apt-get update

# Install pre-requisites: ansible, git, and python3

sudo apt-get install -y ansible git

sudo apt-get install -y python3

# Create a temporary project called devops_pull

mkdir ~/devops_pull

cd ~/devops_pull

sudo ansible-pull -i hosts.ini -U https://github.com/CEP-Comwell/devops_pull.git
