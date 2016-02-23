#!/bin/sh

# Don't check for known_host
export ANSIBLE_HOST_KEY_CHECKING=False

echo "****************** Verifying ping connection: ******************"

# Check ping connection
ansible all -m ping --private-key=insecure_private_key -u vagrant -i ../create_monosite-cluster/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

# run playbooks
echo "****************** Running: playbook.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i ../create_monosite-cluster/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml
