# devops_pull
Ansible-pull script for DevOps endpoints

# Run apt update && apt upgrade
sudo apt update
sudo apt upgrade

# Install git and ansible
sudo apt install git
sudo apt install ansible -y

# Create a temporary project called devops_pull
mkdir ~/devops_pull
cd ~/devops_pull
sudo ansible-pull -i hosts.ini -U https://github.com/CEP-Comwell/devops_pull.git
