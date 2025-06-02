# devops_pull
Ansible-pull script for DevOps endpoints

# Run apt update && apt upgrade
sudo apt update
sudo apt upgrade

# Install git and ansible
sudo apt install git
sudo apt install ansible -y

# Create a project called edgesec.ca 
mkdir ~/edgesec.ca
cd edgesec.ca
git clone https://github.com/CEP-Comwell/devops_pull.git
ansible-pull local.yml -i hosts.ini


