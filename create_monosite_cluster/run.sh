#!/bin/sh

# Don't check for known_host
export ANSIBLE_HOST_KEY_CHECKING=False

# vars/global_vars.yml
# verify few things before starting
vars="vars/global_vars.yml"

splunk_deployment=`grep 'splunk_deployment:' $vars | awk '{print $2}'`
if [ ! -d $splunk_deployment ]; then
    echo "ERROR, splunk_deployment directory location set in $vars could not be found, so far we tried $splunk_deployment"
    exit 1
fi

splunk_binpath=`grep 'splunk_binpath:' $vars | awk '{print $9}' | awk -F"'" '{print $2}'`
ls $splunk_deployment/$splunk_binpath > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "ERROR, Splunk binary could not be found, so far we tried $splunk_deployment/$splunk_binpath"
    exit 1
fi

splunkforwarder_binpath=`grep 'splunkforwarder_binpath:' $vars | awk '{print $9}' | awk -F"'" '{print $2}'`
ls $splunk_deployment/$splunkforwarder_binpath > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "ERROR, Splunk forwarder binary could not be found, so far we tried $splunk_deployment/$splunkforwarder_binpath"
    exit 1
fi

core_archive=`grep 'core_archive:' $vars | awk '{print $9}' | awk -F"'" '{print $2}'`
ls $splunk_deployment/$core_archive > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "ERROR, The Nmon performance core archive could not be found, so far we tried $splunk_deployment/$core_archive"
    exit 1
fi


end_message () {
    cat end_message.txt
}

echo "****************** Starting vagrant VMs: ******************"
vagrant up

echo "****************** Verifying ping connection: ******************"

# Check ping connection
ansible all -m ping --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

# run playbooks
echo "****************** Running: part1_deploysplunk.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part1_deploysplunk.yml
echo "****************** Running: part2_master_config.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part2_master_config.yml
echo "****************** Running: part3_indexers_config.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part3_indexers_config.yml
echo "****************** Running: part4_shcluster.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part4_shcluster.yml
echo "****************** Running: part5_deployment_server_and_clients.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory part5_deployment_server_and_clients.yml
echo "****************** Running: deploy_nmon.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory deploy_nmon.yml

echo "****************** Done, hosts map: ******************"
cat hosts | grep -v localhost
echo "******************************************************"

# Show end message
end_message

exit 0
