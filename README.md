# digital-ocean-jenkins-dev-environment
Use salt-cloud to instantly spin up a new Jenkins dev environment on Digital Ocean. This environment is used to develop additional Jenkins plugins.

Getting started, testing DigitalOcean v2 API from a Ubuntu box on DigitalOcean:

git clone https://github.com/billyjf/digital-ocean-jenkins-dev-environment.git
cd digital-ocean-jenkins-dev-environment
./install-salt-cloud.sh
scp [your-private-digital-ocean-ssh-key] root@[do-public]:~/.ssh/id_rsa
./configure-digital-ocean.sh [your-personal-access-token] [ssh-key-names] [location]
salt-cloud --list-sizes digitalocean

configure-digital-ocean.sh Example CLI:
./configure-digital-ocean.sh "lk23j4lkjl2k3j4lk2j3ksdjfkj23k3 ..." "salt-cloud" "San Francisco 1"
