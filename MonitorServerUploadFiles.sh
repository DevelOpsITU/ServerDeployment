#!/bin/bash
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line

scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./MonitoringServer/ root@monitoring.thomsen-it.dk:/root/
scp -r -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./authorized_keys root@monitoring.thomsen-it.dk:/root/.ssh/authorized_keys

echo "upload complete."
