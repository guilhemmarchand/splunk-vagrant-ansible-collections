#!/bin/sh

# Don't check for known_host
export ANSIBLE_HOST_KEY_CHECKING=False

echo "****************** Starting vagrant VMs: ******************"
vagrant up

echo "****************** Verifying ping connection: ******************"

# Check ping connection
ansible all -m ping --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

# run playbooks
echo "****************** Running: part1_deploysplunk.yml ******************"
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part1_deploysplunk.yml
echo "****************** Running: part2_master_config.yml ******************"
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part2_master_config.yml
echo "****************** Running: part3_indexers_config.yml ******************"
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part3_indexers_config.yml
echo "****************** Running: part4_shcluster.yml ******************"
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part4_shcluster.yml
echo "****************** Running: part5_deployment_server_and_clients.yml ******************"
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part5_deployment_server_and_clients.yml

echo "****************** Done, hosts map: ******************"
cat hosts | grep -v localhost
echo "******************************************************"

exit 0