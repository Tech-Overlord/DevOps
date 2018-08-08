#! /bin/bash

## This script installs ansible on Redhat based (CentOS) or Debian based (Ubuntu) machines.
## Easy to use script when initializing either of the systems with Vagrant or in isolation.

## Tested on Ubuntu 16.04 xenial & CentOS 7.

if [ "$(grep -Ei 'ID=ubuntu' /etc/os-release)" ]; 
then
	printf "OS is Ubuntu."
	echo
	if [ "$(grep -Ei 'VERSION_ID="14.04"' /etc/os-release)" ];
	then
		printf "OS Version is 14.04 i.e. Ubuntu 14.04 trusty"
		printf "Beginning of pre-requistes & ansible installation.\n"
		sudo apt-get update -y
		sudo apt-get install software-properties-common -y
		sudo apt-add-repository ppa:ansible/ansible -y		# Adding Ansible's PPA.
		sudo apt-get update -y
		sudo apt-get install ansible -y
		printf "Installation of ansible has been completed!"
	elif [ "$(grep -Ei 'VERSION_ID="16.04"' /etc/os-release)" ];
	then
		printf "OS Version is 16.04 i.e. Ubuntu 16.04 xenial"
		printf "Beginning of pre-requistes & ansible installation.\n"
		sudo apt-get update -y
		sudo apt-get install software-properties-common -y
		sudo apt-add-repository ppa:ansible/ansible -y		# Adding Ansible's PPA.
		sudo apt-get update -y
		sudo apt-get install ansible -y
		printf "Installation of ansible has been completed!"
	elif [ "$(grep -Ei 'VERSION_ID="18.04"' /etc/os-release)" ];
	then
		printf "OS Version is 18.04 i.e. Ubuntu 18.04 bionic"
		printf "Beginning of pre-requistes & ansible installation.\n"
		sudo apt-get update -y
		sudo apt-get install software-properties-common -y
		sudo apt-add-repository ppa:ansible/ansible -y		# Adding Ansible's PPA.
		sudo apt-get update -y
		sudo apt-get install ansible -y
		printf "Installation of ansible has been completed!"
	else
		echo "OS is not one of the LTS ubuntu versions."
	fi
else
	echo "This was scripted for LTS version of Ubuntu OS's. Please contact Ali Muhammad (https://github.com/Tech-Overlord) to add the required Ubuntu OS version into the script."
fi

if [ "$(grep -Ei 'ID="centos"|CENTOS_MANTISBT_PROJECT_VERSION="7"' /etc/os-release)" ]; then
   printf "OS is CentOS & Version is 7 i.e. CentOS-7"
   printf "Beginning of ansible installation."
   sudo yum install epel-release #ensuring that we have epel-release repository added.
   sudo yum install ansible -y
   printf "Installation of ansible has been completed!"
fi
