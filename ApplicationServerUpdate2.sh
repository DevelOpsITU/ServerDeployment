#!/bin/bash
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line
# -o "StrictHostKeyChecking no" 
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./ApplicationServer2/ root@t164.92.180.23:/root/
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./authorized_keys root@164.92.180.23:/root/.ssh/authorized_keys

ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@164.92.180.23 "cd ApplicationServer2; chmod +x ./update.sh; ./update.sh"

echo "Setup complete."
