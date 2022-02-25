
# https://serverfault.com/questions/638600/auto-accept-rsa-key-fingerprint-from-command-line
# -o "StrictHostKeyChecking no" 
scp -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ./init.sh root@thomsen-it.dk:/root/init.sh

ssh -i $SSH_KEY_NAME -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@thomsen-it.dk "chmod +x ./init.sh; ./init.sh"

echo "Setup complete."
