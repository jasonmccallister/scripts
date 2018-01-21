#!/usr/bin/env bash

# ask for the new username
read -p 'Enter the username that should be able to run docker commands: ' USERN

# setup docker with dependencies
apt-get update && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' && apt-get update

# set the policy to install from new repo and install
apt-cache policy docker-engine && apt-get install -y docker-engine

# add user to the docker group to run commands
usermod -aG docker $USERN

# install docker swarm and set the IP

# DIGITAL OCEAN

# use the public IP
# IP=$(/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')

# use the internal IP
IP=$(/sbin/ifconfig eth1 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')

# PACKET.NET

# use the private ip for packet.net
# IP=$(/sbin/ifconfig bond0:0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')

docker swarm init --advertise-addr $IP
