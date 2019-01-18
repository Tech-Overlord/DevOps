#!/bin/bash

# SCRIPT WAS SCRIPTED WITH THE CONSIDERATION THAT IT WILL BE RUN USING "root" USER. So please switch to root user to execute it.
## This script automatically installs and sets environment variables for JAVA JDK.
## Please note that the URL in the wget command will need to be modified prior to execution if a newer version has been released by Oracle. So, please check Oracle's website prior to execution of the script or simply paste replace the URL with the latest x64 version of Oracle Java 8's JDK tar.gz file available on their web. You can find it here: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

set -e

# Change to opt directory
cd /opt
mkdir jdk
cd jdk

echo
echo "Current working in the following directory: $(pwd)"
echo

# Download Oracle's JAVA JDK 8u181. Latest version of Java 8 available at the time of this script's inception. If there is a newer version, then you need to replace the http URL with that of the latest version from Oracle Java's website.
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz

## Assign the tar downloaded as a varlue to a variable for use in the script.
tar_name=`ls jdk-*`

echo
echo "Tar downloaded is: $tar_name"
echo
# Untarring the downloaded tar file within /opt
tar -zxf $tar_name -C /opt/jdk/

tar_dir=`ls -d jdk1*`

echo
echo "$tar_name has been untarred in the directory: $tar_dir"
echo

# Installing java
update-alternatives --install /usr/bin/java java /opt/jdk/$tar_dir/bin/java 100
echo

# Installing javac
update-alternatives --install /usr/bin/javac javac /opt/jdk/$tar_dir/bin/javac 100
echo

# Outputs java links
update-alternatives --display java
echo

# Exporting required environment variables.
export JAVA_HOME=/opt/jdk/$tar_dir
export JRE_HOME=/opt/jdk/$tar_dir/jre
export PATH=$PATH:/opt/jdk/$tar_dir/bin:/opt/jdk/$tar_dir/jre/bin

# Confirm the environment variables by running an echo against the variables.
echo
echo "JAVA_HOME variable has been set as: $JAVA_HOME"
echo

echo
echo "JRE_HOME variable has been set as: $JRE_HOME"
echo

echo
echo "PATH variable has been set as: $PATH"
echo

# Setting these environment variables/values to /etc/environment - which will make JDK/JRE available to all users on the machine.
echo "JAVA_HOME=/opt/jdk/$tar_dir" >> /etc/environment
echo "JRE_HOME=/opt/jdk/$tar_dir" >> /etc/environment
environment_file=`cat /etc/environment`

echo
echo "The contents of /etc/environment file are the following: "
echo "$environment_file"
echo