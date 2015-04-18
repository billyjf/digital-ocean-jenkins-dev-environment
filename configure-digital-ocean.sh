personal_access_token="$1"
ssh_key_names="$2"
location="$3"

if [ -z "$personal_access_token" ] || [ -z "$ssh_key_names" ] || [ -z "$location" ]
then
  echo "Usage: configure-digital-ocean.sh: [personal_access_token] [ssh_key_names] [boot location]"
  exit 1
fi

cat > /etc/salt/cloud.providers.d/digitalocean.conf <<_EOF_
digitalocean:
  provider: digital_ocean
  personal_access_token: $personal_access_token
  ssh_key_file: /root/.ssh/id_rsa
  ssh_key_names: "$ssh_key_names"
  location: "$location"
_EOF_

cat > /etc/salt/cloud.profiles.d/digitalocean.conf <<_EOF_
digitalocean-ubuntu:
  provider: digitalocean
  image: "14.04 x64"
  size: 1GB
  location: "$location"
  private_networking: False
  backups_enabled: False
  ipv6: False
_EOF_
