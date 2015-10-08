#!/bin/bash -e

apt-get update
apt-get upgrade -y

aptitude install build-essential libssl-dev git-core redis-server libexpat1-dev logtail -y

NODE_VERSION="v0.12.7"
NODE_BASE="node-${NODE_VERSION}"

pushd /usr/local
  wget http://nodejs.org/dist/${NODE_VERSION}/${NODE_BASE}.tar.gz
  tar xf ${NODE_BASE}.tar.gz -C src && cd src/${NODE_BASE}
  ./configure && make && make install
popd

# Coffeescript
npm install -g coffee-script

# Invitation Service
pushd /node/invite-service
  npm install
popd

