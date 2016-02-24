#!/bin/sh

export VAGRANT_HOME=`pwd`

echo "****************** Desroying vagrant VMs: ******************"

for server in master peer1 peer2 head1 head2 head3 deployment1 uf1; do

   vagrant destroy $server -f

done

echo "****************** Done. ******************"
