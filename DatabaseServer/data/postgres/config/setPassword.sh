#!/bin/bash

if [ -z "$1" ]
then
      echo "Password cannot be empty."
      exit 1
else
      echo "Update password"
      psql -U postgres -c "ALTER USER postgres PASSWORD '$1';"
fi