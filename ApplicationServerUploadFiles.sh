#!/bin/bash
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line

scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./ApplicationServer/ root@134.122.67.208:/root/
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./authorized_keys root@134.122.67.208:/root/.ssh/authorized_keys

echo "Upload complete."
