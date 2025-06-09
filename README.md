# devops_pull

An Ansible-based automation project for managing DevOps endpoints. This repository contains playbooks and tasks to configure and maintain systems efficiently.

## Overview

The `devops_pull` project uses `ansible-pull` to apply configurations to endpoints. The main playbook, `local.yml`, is designed to:
- Update system repositories.
- Install and configure required packages.
- Manage user accounts and permissions.
- Configure firewalls and other system services.

### Key Features
- **Idempotent Configuration**: Ensures tasks are only applied when necessary.
- **Modular Design**: Tasks are organized into reusable files for better maintainability.
- **Customizable**: Variables and roles can be adjusted to suit different environments.

---

## Prerequisites

Before running the deployment script, ensure the following:
1. **Supported Operating System**: The playbook is designed for Debian-based systems (e.g., Ubuntu). For RedHat-based systems, update the `ansible_os_family` variable in `local.yml`.
2. **Required Packages**: The following packages must be installed:
   - `ansible`
   - `git`
   - `python3`
3. **Network Access**: The system must have internet access to clone the repository and download required packages.

---

## How to Use

### 1. Clone the Repository
If you want to manually clone the repository, run:
```bash
git clone https://github.com/CEP-Comwell/devops_pull.git
cd devops_pull
```

### 2. Run the Deployment Script
The `deploy.sh` script automates the setup and execution of `ansible-pull`. Follow these steps:

1. Download the `deploy.sh` script or create it in your environment.
2. Make the script executable:
   ```bash
   chmod +x deploy.sh
   ```
3. Run the script:
   ```bash
   ./deploy.sh
   ```

The script will:
- Install required packages (`ansible`, `git`, `python3`).
- Create the directory structure `$HOME/edgesec.ca/devops_pull`.
- Run `ansible-pull` to apply the configurations defined in `local.yml`.

---

## Playbook Details

The `local.yml` playbook is the main entry point for the `devops_pull` project. Below is an overview of its structure:

```yaml
---
# This is the main Ansible playbook
- hosts: localhost
  connection: local
  gather_facts: false
  become: true

  vars:
    ansible_os_family: "Debian"  # Set this to "RedHat" if using a RedHat-based system
    allowed_services:
      - ssh
      - https

  pre_tasks:
    - name: update repositories
      apt:
        update_cache: yes
      changed_when: False

  roles:
    - vscode

  tasks:
    - import_tasks: tasks/users.yml
    - import_tasks: tasks/packages.yml
    - import_tasks: tasks/firewalld.yml
    - import_tasks: tasks/packages-flatpak.yml
    - import_tasks: tasks/cron.yml

  handlers:
    - name: Restart Fail2Ban
      service:
        name: fail2ban
        state: restarted
```

---

## Project Structure

```
devops_pull/
├── local.yml                # Main Ansible playbook
├── tasks/
│   ├── users.yml            # Manages user accounts and sudoers
│   ├── packages.yml         # Installs required packages
│   ├── firewalld.yml        # Configures the firewall
│   ├── packages-flatpak.yml # Manages Flatpak packages
│   ├── cron.yml             # Configures cron jobs
├── roles/
│   └── vscode/              # Role for Visual Studio Code setup
├── handlers/
│   └── main.yml             # Handlers for tasks
└── README.md                # Project documentation
```

---

## Troubleshooting

### Common Issues
1. **Permission Denied**:
   Ensure the user running the script has sudo privileges.
2. **Repository Access**:
   If the repository is private, ensure the system has the necessary credentials (e.g., SSH key or HTTPS token).
3. **Missing Packages**:
   If `ansible` or `git` is not installed, rerun the script to install them.

### Debugging
To debug issues, run the `ansible-pull` command manually:
```bash
ansible-pull -i hosts.ini -U https://github.com/CEP-Comwell/devops_pull.git
```

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

**CEP-Comwell DevOps Team**

For questions or support, contact the team at [support@cep-comwell.com](mailto:support@cep-comwell.com).
