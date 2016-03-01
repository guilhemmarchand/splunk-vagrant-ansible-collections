# This will create a full Splunk multi-site cluster with:

- master node
- 4 x peer nodes (indexers), 2 x on site 1, 2 x on site 2 
- 3 x search head nodes in sh cluster with no search affinity that will search across both sites
- 2 x deployment server, 1 x on each site
- 2 x Universal Forwarder client, 1 x on each site

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

[![asciicast](https://asciinema.org/a/80m4mjxm65ig5sf9j9vm3c5mj.png)](https://asciinema.org/a/80m4mjxm65ig5sf9j9vm3c5mj?speed=15)

Once operations are done, you can:

* Connect to the master node and access for example the DMC (Distributed Management Console)

http://192.168.33.101:8000

With login / password: admin / admin

* Connect to one of search heads: (example with the first search head)

http://192.168.33.104:8000

With login / password: admin / admin

* Connect to deployment servers and administer connected Universal Forwarders

http://192.168.33.110:8000 / http://192.168.33.110:8000

With login / password: admin / admin

# Stop the virtual environment, and free all resources

Simply run:

`$ ./destroy.sh`

[![asciicast](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5.png)](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5?speed=15)




