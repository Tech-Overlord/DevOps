#! /bin/bash

## This script installs Docker CE (Community Edition) on CentOS Ubuntu machines.
## Easy to use script when initializing either of the systems with Vagrant or in isolation.

## Tested on Ubuntu 16.04 xenial & CentOS 7.

## Note: Docker requires a 64-bit version of Ubuntu as well as a kernel version equal to or greater than 3.10. The default 64-bit Ubuntu 16.04 server meets these requirements.

if [ "$(grep -Ei 'ID=ubuntu|VERSION_ID="16.04"' /etc/os-release)" ]; 
then
	echo "OS is Ubuntu." && echo
	if [ "$(grep -Ei 'VERSION_ID="16.04"' /etc/os-release)" ];
	then
		echo "OS Version is 16.04 i.e. Ubuntu 16.04 xenial" && echo
		echo "Beginning of pre-requistes & docker installation." && echo
		echo "Performing apt-get update" && echo
		sudo apt-get update -y
		sleep 30
		echo
		echo "Adding gpg of Docker's repository to our system." && echo
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ## Adding official docker repository's gpg to system.
		echo "Adding docker repository to APT's sources." && echo
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"		# Addition of docker repository to APT's sources.
		sudo apt-cache policy docker-ce	# Printing information on where docker is being fetched from.
		echo "Installing docker-ce via apt-get" && echo
		sudo apt-get install -y docker-ce	# Installing Docker
		sleep 30
		echo
		echo "Running service enable command to ensure that the service is started!" && echo
		sudo systemctl enable docker
		sleep 3
		echo
		echo "Checking if systemctl service of docker-ce is now available." && echo
		sudo systemctl status docker	# Confirming service status of Docker to see if it's running.
		echo "Adding current user to docker group." && echo
		sudo usermod -aG docker $(whoami)	# Adding current user to the Docker Group.
		echo "Installation of docker has been completed!" && echo
	elif [ "$(grep -Ei 'VERSION_ID="18.04"' /etc/os-release)" ];
	then
		echo "OS Version is 18.04 i.e. Ubuntu 18.04 bionic" && echo
		echo "Beginning of pre-requistes & docker installation." && echo
		echo "Performing apt-get update" && echo
		sudo apt-get update -y
		sleep 30
		echo
		echo "Confirming if apt-transport-https ca-certificates curl software-properties-common are installed by trying to install them."
		sudo apt install apt-transport-https ca-certificates curl software-properties-common
		sleep 20
		echo
		echo "Adding gpg of Docker's repository to our system." && echo
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ## Adding official docker repository's gpg to system.
		echo "Adding docker repository to APT's sources." && echo
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"		# Addition of docker repository to APT's sources.
		sudo apt-cache policy docker-ce	# Printing information on where docker is being fetched from.
		echo "Installing docker-ce via apt-get" && echo
		sudo apt-get install -y docker-ce	# Installing Docker
		sleep 30
		echo
		echo "Running service enable command to ensure that the service is started!" && echo
		sudo systemctl enable docker
		sleep 3
		echo
		echo "Checking if systemctl service of docker-ce is now available." && echo
		sudo systemctl status docker	# Confirming service status of Docker to see if it's running.
		echo "Adding current user to docker group." && echo
		sudo usermod -aG docker $(whoami)	# Adding current user to the Docker Group.
		echo "Installation of docker has been completed!" && echo
	else
		echo "OS is not one of the LTS ubuntu versions."
	fi
else
	echo "This was scripted for LTS version of Ubuntu OS's. Please contact Ali Muhammad (https://github.com/Tech-Overlord) to add the required Ubuntu OS version into the script."
fi

if [ "$(grep -Ei 'ID="centos"|CENTOS_MANTISBT_PROJECT_VERSION="7"' /etc/os-release)" ]; 
then
   echo
   echo "OS is CentOS & Version is 7 i.e. CentOS-7" && echo
   echo "Beginning of pre-requistes & docker installation." && echo
   echo "Performing update." && echo
   sudo sudo yum update -y
   sleep 30
   echo
   echo "Adding repository for latest version of Docker" && echo
   curl -fsSL https://get.docker.com/ | sh
   sleep 30
   echo
   echo "Starting Docker service" && echo
   sudo systemctl start docker
   echo
   echo "Enabling Docker service to run on each reboot" && echo
   sudo systemctl enable docker
   echo "Checking Docker service status" && echo
   sudo systemctl status docker
   echo
   echo "Adding current user to docker group" && echo
   sudo usermod -aG docker $(whoami)
   echo "Installation of docker has been completed!"
fi
