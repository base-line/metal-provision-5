#!/usr/bin/env bash

which curl wget unzip jq &>/dev/null || {
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install --no-install-recommends -y curl wget
}

# check arch
if [[ "`uname -m`" =~ "arm" ]]; then
    ARCH=arm
elif [[ "`uname -m`" == "aarch64" ]]; then
    ARCH=arm64
else
    ARCH=amd64
fi

# check the platform
if [[ "`uname`" == 'Linux' ]]; then
   PLATFORM='linux'
elif [[ "`uname`" == 'FreeBSD' ]]; then
   PLATFORM='freebsd'
fi

# download the metal-cli
wget -q -O /usr/local/bin/metal https://github.com/equinix/metal-cli/releases/download/v0.6.0/metal-${PLATFORM}-${ARCH}
chmod +x /usr/local/bin/metal

# copy cli configuration to skil - metal init
mkdir -p /home/vagrant/.config/equinix/
cp /vagrant/config/metal.yaml /home/vagrant/.config/equinix/metal.yaml

# install terraform-doc
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs /usr/local/bin/terraform-docs