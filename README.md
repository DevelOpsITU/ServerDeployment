# ServerDeployment

Configuration files that describes how the servers are deployed.

This guide have been used to setup the config file [https://github.com/devopsgroup-io/vagrant-digitalocean](https://github.com/devopsgroup-io/vagrant-digitalocean)

## Servers

The idea of the server deployment is that we would most likely have the following structure:

- Application server(s)
- Database server
- Monitoring/Logging server

The idea is that with this clear separation will the searching of logs not effect the service that we are providing on the application servers. and we could maybe scale the different "service" differently.

i.e. the application servers needs a server with a strong CPU to serve our clients quickly. and mayne our database server needs a lot of RAM. and we could choose different servers for the different use cases.

## General deployment setup

This section describes how to deploy the servers.

### Prerequisites

information needed:

- Access to the account at Digital Ocean
- Have the Digital Ocean Token
- Have an ssh key that can be used to configure the server

Tools needed:

- Install [VirtualBox](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)
- Install Digital Ocean plugin

``` shell
vagrant plugin install vagrant-digitalocean
```

To deploy the server on Digital ocean there are a few settings that needs to be set.

- DIGITAL_OCEAN_TOKEN: Key retrieved from Digital ocean.
- SSH_KEY_NAME
- DATABASE_PASSWORD

```shell
export DIGITAL_OCEAN_TOKEN=SuperSecretSharedSecretWithDigitalOcean
```

Test the the info is set with the following command:

```shell
echo $DIGITAL_OCEAN_TOKEN && echo $SSH_KEY_NAME && echo $DATABASE_PASSWORD
```

## Application server

The servers that host our applications that users are using.

### Deployment

This section will explain the process of spinning up the server(s) at digital ocean. It is a requirement to also have access to the administration panel at DigitalOcean.

The following code snippets will include both in- and output. Inputs is defined by starting with `$`

```shell
$ vagrant up ApplicationServer
Bringing machine 'ApplicationServer' up with 'digital_ocean' provider...
==> ApplicationServer: Using existing SSH key: Vagrant
==> ApplicationServer: Creating a new droplet...
==> ApplicationServer: Assigned IP address: 139.59.208.47
==> ApplicationServer: Private IP address: 10.114.0.2
```

Go to the [Digital Ocean admin page for floating IP's](https://cloud.digitalocean.com/networking/floating_ips) and assign 138.68.125.107 to the newly created ApplicationServer.

---

**NOTE** This could maybe be added to a script.

---

```shell
$ ./ApplicationServerInit.sh
Warning: Permanently added 'thomsen-it.dk,138.68.125.107' (ECDSA) to the list of known hosts.
init.sh                                                                                                                                                       100%  843    34.8KB/s   00:00    
Warning: Permanently added 'thomsen-it.dk,138.68.125.107' (ECDSA) to the list of known hosts.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://mirrors.digitalocean.com/ubuntu focal InRelease
Get:2 http://mirrors.digitalocean.com/ubuntu focal-updates InRelease [114 kB]
Get:3 http://mirrors.digitalocean.com/ubuntu focal-backports InRelease [108 kB]
Get:4 http://mirrors.digitalocean.com/ubuntu focal-updates/main amd64 Packages [1600 kB]

...
...

Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...
Docker version 20.10.12, build e91ed57
docker-compose version 1.29.2, build 5becea4c
Setup complete.
```

The server is now configured setup with docker and docker-compose.

The init script have installed the following

- TLS certificates have been signed by [Lets Encrypt](https://letsencrypt.org/) with [cert bot](https://certbot.eff.org/)
- docker
- docker-compose

The application server is now setup to run the following docker applications

- Nginx
  - accepts connections on 80 and 443.
  - Port 80 will redirect to 443.
  - Port 443 will do an TLS termination and redirect to minitwit

- "minitwit"
  - A simple docker application that responds with the headers that was sent to the application

All access to the applications go through the Nginx and is logged in the folder `/var/log/nginx/`.

## Database server

The database server should host the database that we are using to persist the for the application.

Below is a deployment diagrams of what containers lives on the server

![Deployment diagram](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/DevelOpsITU/ServerDeployment/tree/%239-Setup-Postgre-server/Diagrams/DatabaseServer/deployment.iuml)

The Database server takes much inspiration from the Application server section.

To start the server:

- `vagrant up DatabaseServer`
- Assign the ip to the new droplet
- `./DatabaseServerInit.sh`

To update the configurations of the server use

- `./DatabaseServerUpdate.sh`

## Security considerations

- We need to make sure that the firewall is configured correctly. i.e. allow only access to ports 22, 80, 443.
- And all connections to the ssh, must be through public private key. and not allow password access.
- Right now there is only one user on the server and that is root.
- root have sudo privileges. root are currently also running the docker containers.
- root have direct access to the database container and are currently allowed to change the password of the database.
