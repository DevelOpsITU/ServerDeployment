#!/bin/bash
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line
# -o "StrictHostKeyChecking no" 
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./ApplicationServer/ root@thomsen-it.dk:/root/

ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@thomsen-it.dk "cd ApplicationServer; chmod +x ./init.sh; ./init.sh"

echo "Setup complete."
