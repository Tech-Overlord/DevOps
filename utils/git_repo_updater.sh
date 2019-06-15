#!/bin/bash

echo -e "\nCurrent directory is:\t ${PWD}\n"

read -p "Enter the exact path you would like to scan and update git repos under (for e.g. / , /usr/ , /home/ ): " path

echo -e "____________________________________________________________"

repo_list=`find ${path} -type d -name "*.git" | sed 's/\.git//'`

for repo in ${repo_list};
do
  echo -e "\nUpdating repo found in: ${repo}\n"
  cd $repo
  git pull
  echo -e "____________________________________________________________"
done
