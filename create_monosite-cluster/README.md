# This will create a full Splunk mono-site cluster with:

- master node
- 2 x peer nodes (indexers)
- 3 x search head nodes in sh cluster
- 1 x deployment server
- 1 x Universal Forwarder client

# pre-requisites:

- Virtualbox
- Vagrant
- Ansible

# How to use:

* Download the Splunk tar.gz archive for Linux 64 bits and store it in: /opt/deployment/splunk_bin/

See: http://www.splunk.com/en_us/download/splunk-enterprise.html

* Download the Splunk Universal Forwarder tar.gz archive for Linux 64 bits, and store it in: /opt/deployment/splunk_bin/

See: http://www.splunk.com/en_us/download/universal-forwarder.html

* Install requirements (Virtualbox, Vagrant, Ansible) if needed

# Start the virtual environment:

`$ ./run.sh`

This will start the entire environment and run Ansible playbooks.

[![asciicast](https://asciinema.org/a/2ca7yzk9c2w4rbrpdzjigvd5v.png)](https://asciinema.org/a/2ca7yzk9c2w4rbrpdzjigvd5v?speed=10&theme=tango)

Once operations are done, you can:

* Connect to the master node and access for example the DMC (Distributed Management Console)

http://192.168.33.101:8000

With login / password: admin / admin

* Connect to one of search heads: (example with the first search head)

http://192.168.33.104:8000

With login / password: admin / admin

* Connect to the deployment server and administer connected Universal Forwarders

http://192.168.33.107:8000

With login / password: admin / admin

# Stop the virtual environment, and free all resources

Simply run:

`$ ./destroy.sh`

[![asciicast](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5.png)](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5?speed=10&theme=tango)




