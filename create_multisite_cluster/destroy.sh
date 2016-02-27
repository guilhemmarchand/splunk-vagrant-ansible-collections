#!/bin/sh

export VAGRANT_HOME=`pwd`

echo "****************** Destroying vagrant VMs: ******************"

for server in master peer1-site1 peer2-site1 peer1-site2 peer2-site2 head1 head2 head3 deployment1-site1 deployment1-site2 uf1-site1 uf1-site2; do

   vagrant destroy $server -f

done

echo "****************** Done. ******************"
