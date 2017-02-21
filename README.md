# splunk-vagrant-ansible-collections

This repository is a personal collection of configuration files and scripts that make an heavy use of Vagrant and Ansible to create on the fly full Splunk environments for testing and development purposes.

These repositories will use:

- Virtualbox as the virtualization layer (but you could use other provider), See:https://www.virtualbox.org
- Vagrant, an incredibly powerful tool, See: https://www.vagrantup.com

Running these virtual environments will require a modern enough computer with physical memory, and fast storage.

Following items are available:

## create_monosite_cluster

This scenario uses Vagrant and Ansible to create on a fly a mono-site Splunk cluster with Nmon Performance app deployment.

Instructions are available in the [README](https://github.com/guilhemmarchand/splunk-vagrant-ansible-collections/tree/master/create_monosite_cluster) of the repository

## create_multisite_cluster

This scenario uses Vagrant and Ansible to create on a fly a mutli-site Splunk cluster with Nmon Performance app deployment.

Instructions are available in the [README](https://github.com/guilhemmarchand/splunk-vagrant-ansible-collections/tree/master/create_multisite_cluster) of the repository

## create_standalone_multiple_indexes

This scenario uses Vagrant and Ansible to create on a fly a Splunk server with Nmon Performance app deployment. (multi-indexes deployment)

Instructions are available in the [README](https://github.com/guilhemmarchand/splunk-vagrant-ansible-collections/tree/master/create_standalone_multiple_indexes) of the repository
