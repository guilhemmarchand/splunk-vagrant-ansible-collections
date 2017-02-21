#!/usr/bin/env bash

export VAGRANT_HOME=`pwd`

echo "****************** Destroying vagrant VMs: ******************"

vagrant destroy --force

# clean vagrant various files
data="
gems
tmp
setup_version
rgloader
data
insecure_private_key
.vagrant"

for data in $data; do
   rm -rf $data
done

echo "****************** Done. ******************"
