#!/usr/bin/env bash

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

ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml

# Show end message
end_message

exit 0
