# digital-ocean-jenkins-dev-environment
Use salt-cloud to instantly spin up a new Jenkins dev environment on Digital Ocean. This environment is used to develop additional Jenkins plugins.

# Getting started #

## Booting a New Saltmaster With DigitalOcean User Data ##
Copy and pasting the following bash code into the user data and filling in the blanks (e.g. the ...) will boot a new saltmaster ready and pre-configured for salt-cloud with the digitalocean v2 API provider.

Saving the complete text into a private location on your computing device will allow you to re-deploy an entire infrastructure with a single click by copy and pasting from that file into the DigitalOcean web interface. With salt-cloud pre-configured, it is then quick and easy to spin up many more droplets and provision them using salt.

```
#!/bin/bash
apt-get update
apt-get install -y git
git clone https://github.com/billyjf/digital-ocean-jenkins-dev-environment.git
cd digital-ocean-jenkins-dev-environment
./install-salt-cloud.sh
cat > /root/.ssh/id_rsa << _EOF_
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
_EOF_
chmod 600 /root/.ssh/id_rsa
./configure-digital-ocean.sh "ab983fs ... pw9" salt-cloud "San Francisco 1"
```

## Testing salt-cloud DigitalOcean v2 API from a Ubuntu box on DigitalOcean: ##

```
git clone https://github.com/billyjf/digital-ocean-jenkins-dev-environment.git
cd digital-ocean-jenkins-dev-environment
./install-salt-cloud.sh
scp [your-private-digital-ocean-ssh-key] root@[do-public]:/root/.ssh/id_rsa
./configure-digital-ocean.sh [your-personal-access-token] [ssh-key-names] [location]
salt-cloud --list-sizes digitalocean
salt-cloud -p digitalocean-ubuntu salt-cloud 
```

## configure-digital-ocean.sh Example CLI: ##
./configure-digital-ocean.sh "lk23j4lkjl2k3j4lk2j3ksdjfkj23k3 ..." "salt-cloud" "San Francisco 1"
