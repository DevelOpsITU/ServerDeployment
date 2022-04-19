#!/bin/bash
sudo apt update
sudo apt upgrade -y

# install certbot
# https://certbot.eff.org/
# https://eff-certbot.readthedocs.io/en/stable/
# https://stackoverflow.com/questions/49172841/how-to-install-certbot-lets-encrypt-without-interaction

server_name=thomsen-it.dk
sudo apt install nginx -y
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx --non-interactive --agree-tos -d $server_name -d www.$server_name --email webmaster@$server_name

sudo systemctl status nginx
sudo service nginx stop
sudo systemctl disable nginx
nginx -s stop
sudo systemctl status nginx

#cp -r /etc/letsencrypt/live/thomsen-it.dk ./data/certs/

# Install docker 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce -y


# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# After instalation of docker-compose and running it, it just hung. 
sudo apt install haveged -y # https://stackoverflow.com/questions/59941911/docker-compose-up-hangs-forever-how-to-debug


docker --version
docker-compose --version
docker-compose up -d
docker ps
docker-compose logs

