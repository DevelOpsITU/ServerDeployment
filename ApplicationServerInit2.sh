#!/bin/bash

ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@164.92.180.23 "cd ApplicationServer2; chmod +x ./init.sh; ./init.sh"

echo "Setup complete."
