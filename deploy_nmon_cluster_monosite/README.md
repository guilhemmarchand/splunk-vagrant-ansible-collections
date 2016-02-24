# This will fully deploy the Nmon Performance Monitor App for Splunk within a Splunk mono-site cluster

See the "create_monosite_cluster" of this repo

# How to use:

* Download the Nmon Performance monitor app from Splunk base: https://splunkbase.splunk.com/app/1753 

* Store the tar.gz archive in /opt/deployment/nmon-for-splunk

* Extract the TA-nmon tar.gz archive from the resources directory of the core app above, and store it in the same directory

* Extract the PA-nmon tar.gz archive from the resources directory of the core app above, and store it in the same directory

# Deploy to the virtual environment:

`$ ./run.sh`

[![asciicast](https://asciinema.org/a/cgmlxyelf4maknosrku7236jq.png)](https://asciinema.org/a/cgmlxyelf4maknosrku7236jq?speed=15)
