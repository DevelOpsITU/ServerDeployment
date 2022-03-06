#!/bin/bash

if [ -z "$1" ]
then
      echo "Password cannot be empty."
      exit 1
else
      echo "Update password"
      docker-compose exec -T postgres /bin/bash /root/config/setPassword.sh $1
fi