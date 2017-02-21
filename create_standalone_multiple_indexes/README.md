# This will create a Splunk standalone server with:

- standalone Splunk server
- 4 x Universal Forwarder clients

# pre-requisites:

- Internet connection
- Virtualbox
- Vagrant
- Ansible

# How to use:

* Download the Splunk tar.gz archive for Linux 64 bits and store it in: /opt/deployment/splunk_bin/

See: http://www.splunk.com/en_us/download/splunk-enterprise.html

* Download the Splunk Universal Forwarder tar.gz archive for Linux 64 bits, and store it in: /opt/deployment/splunk_bin/

See: http://www.splunk.com/en_us/download/universal-forwarder.html

* Download the Nmon Performance application, and store it in: /opt/deployment/nmon-for-splunk/

See: https://splunkbase.splunk.com/app/1753

* Install requirements (Virtualbox, Vagrant, Ansible) if needed

# Start the virtual environment:

`$ ./run.sh`

This will start the entire environment and run Ansible playbooks.

[![asciicast](https://asciinema.org/a/80m4mjxm65ig5sf9j9vm3c5mj.png)](https://asciinema.org/a/80m4mjxm65ig5sf9j9vm3c5mj?speed=15)

Once operations are done, you can:

* Connect to Splunk Web:

http://172.28.128.100:8000

With login / password: admin / admin

# Stop the virtual environment, and free all resources

Simply run:

`$ ./destroy.sh`

[![asciicast](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5.png)](https://asciinema.org/a/77wkadwlng00hfjyeuracd0q5?speed=15)
