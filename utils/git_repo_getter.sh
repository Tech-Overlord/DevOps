#!/bin/bash


git_ssh_url="git@github.com"
git_ssh_url_user="darkwizard242"
git_repo_names="ansible-role-pip ansible-role-terraform ansible-role-unzip"


for repo in $git_repo_names;
do
  echo -e "\n\nBeginning to clone from: $git_ssh_url:$git_ssh_url_user/$repo\n"
  git clone $git_ssh_url:$git_ssh_url_user/$repo
done

