#!/bin/bash

# Define variables
ZABBIX_DB_USER=zabbix
ZABBIX_DB_PASSWORD=your_password_here

# Ensure pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip not found, installing..."
    sudo yum install -y python3-pip
else
    echo "pip is already installed"
fi

# Install Ansible using pip if not already installed
if ! command -v ansible &> /dev/null
then
    echo "Ansible not found, installing..."
    sudo pip install ansible
else
    echo "Ansible is already installed"
fi

# Add /usr/local/bin to PATH
export PATH=$PATH:/usr/local/bin

# Run the Ansible playbook
ansible-playbook -i hosts.ini setup_zabbix.yml --extra-vars "zabbix_db_user=${ZABBIX_DB_USER} zabbix_db_password=${ZABBIX_DB_PASSWORD}"
