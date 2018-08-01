#! /bin/bash


# Add repository on Ubuntu for latest stable release of git
sudo add-apt-repository ppa:git-core/ppa -y

# Perform apt-update
sudo apt update

# Install git.
sudo apt install git -y
