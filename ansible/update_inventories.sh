#!/bin/bash

# Paths and Variables
TERRAFORM_OUTPUT_DIR="../terraform"
ANSIBLE_INVENTORY_DIR="/home/anil/mega-project/Multi-env-lac-project/ansible/inventories"

# Navigate to the Terraform directory
cd "$TERRAFORM_OUTPUT_DIR" || { echo "Terraform directory not found"; exit 1; }

# Fetch IPs from Terraform outputs
DEV_IPS=$(terraform output -json dev_public_ips | jq -r '.[]')
STG_IPS=$(terraform output -json stg_public_ips | jq -r '.[]')
PROD_IPS=$(terraform output -json prod_public_ips | jq -r '.[]')

# Function to update inventory file
update_inventory_file() {
    local ips="$1"
    local inventory_file="$2"
    local env="$3"

    > "$inventory_file"
    echo "[servers]" >> "$inventory_file"

    local count=1
    for ip in $ips; do
        echo "server${count} ansible_host=$ip" >> "$inventory_file"
        count=$((count + 1))
    done

    echo "" >> "$inventory_file"
    echo "[servers:vars]" >> "$inventory_file"
    echo "ansible_user=ubuntu" >> "$inventory_file"
    echo "ansible_ssh_private_key_file=/home/amitabh/devops-key" >> "$inventory_file"
    echo "ansible_python_interpreter=/usr/bin/python3" >> "$inventory_file"

    echo "Updated $env inventory: $inventory_file"
}

# Update inventories
update_inventory_file "$DEV_IPS" "$ANSIBLE_INVENTORY_DIR/dev" "dev"
update_inventory_file "$STG_IPS" "$ANSIBLE_INVENTORY_DIR/stg" "stg"
update_inventory_file "$PROD_IPS" "$ANSIBLE_INVENTORY_DIR/prod" "prod"

echo "All inventory files updated successfully!"
