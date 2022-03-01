#!/bin/bash
if [ -z "$DATABASE_PASSWORD" ]
then
      echo "Remember to load the password into the env: DATABASE_PASSWORD"
      exit 1
else
      ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@database.thomsen-it.dk "cd DatabaseServer; chmod +x ./setPassword.sh; ./setPassword.sh $DATABASE_PASSWORD"
fi


