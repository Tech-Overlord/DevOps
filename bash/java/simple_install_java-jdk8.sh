#!/bin/bash

## Update system
apt-get update -y

## Install software-properties-common in case that it is not installed.
apt-get install -y software-properties-common

# Adding repository for installing JAVA
add-apt-repository ppa:webupd8team/java

# Recaching
apt-get update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Downloading/installing Oracle Java 8
apt-get -y install oracle-java8-installer

# Downloading/installing package for setting Java 8 as default
apt-get -y install oracle-java8-set-default