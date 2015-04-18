sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get update
sudo apt-get install -y salt-master
sudo apt-get install -y salt-cloud

# Patch digital ocean provider from v1 to v2
wget https://raw.githubusercontent.com/saltstack/salt/develop/salt/cloud/clouds/digital_ocean_v2.py --output-document="/usr/lib/python2.7/dist-packages/salt/cloud/clouds/digital_ocean.py"
