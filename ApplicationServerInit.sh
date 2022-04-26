#!/bin/bash
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line
# -o "StrictHostKeyChecking no" 
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./ApplicationServer/ root@134.122.67.208:/root/
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./authorized_keys root@134.122.67.208:/root/.ssh/authorized_keys

ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@134.122.67.208 "cd ApplicationServer; chmod +x ./init.sh; ./init.sh"

echo "Setup complete."
