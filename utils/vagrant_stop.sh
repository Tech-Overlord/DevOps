#!/bin/bash

# 1. Script globally checks for all vagrant instances running under the user executing the script.
# 2. Assigns the instance ID's of any running instance to the variable `instances`.
# 3. Checks for whether the variable `instances` has is an empty string.
# 4. If not an empty string, then run a for loop to print vagrant instance information and halts (stops) it.

instances=`vagrant global-status --prune | grep running | awk '{ print $1}'`
  
if [ -z "${instances}" ];
then
  echo -e "\nVagrant instances are not running. No instance to halt!"
else
  for instance in ${instances};
  do
    echo -e "\nVagrant instance state for:\t$instance \n"
    vagrant status ${instance}
    echo -e "\nStopping Vagrant instance:\t$instance\n"
    vagrant halt ${instance}
    echo -e "____________________________________________________________"
  done
fi
