# ServerDeployment

Configuration files that describes how the servers are deployed.

This guide have been used to setup the config file [https://github.com/devopsgroup-io/vagrant-digitalocean](https://github.com/devopsgroup-io/vagrant-digitalocean)

## Prerequisites

- Access to the account at Digital Ocean
- Have the Digital Ocean Token
- Have an ssh key that can be used to configure the server

## Notes on the setup

Right now there is only one user on the server and that is root.

root have sudo privileges. root are currently also  

## Setup

- Install [VirtualBox](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)
- Install Digital Ocean plugin

``` shell
vagrant plugin install vagrant-digitalocean
```

To deploy the server on Digital ocean there are a few settings that needs to be set.

- DIGITAL_OCEAN_TOKEN: Key retrieved from Digital ocean.
- SSH_KEY_NAME

```shell
export DIGITAL_OCEAN_TOKEN=SuperSecretSharedSecretWithDigitalOcean
```

```shell
export SSH_KEY_NAME=C:/Users/JTT/.ssh/id_rsa
```

Test the the info is set with the following command:
```shell
echo $DIGITAL_OCEAN_TOKEN && echo $SSH_KEY_NAME
```

## Deployment

This section will explain the process of spinning up the server(s) at digital ocean. It is a requirement to also have access to the administation panel at DigitalOcean.

The following code snippets will include both in- and output. Inputs is defined by starting with `$`

```shell
$ vagrant up
Bringing machine 'minitwit' up with 'digital_ocean' provider...
==> minitwit: Using existing SSH key: Vagrant
==> minitwit: Creating a new droplet...
==> minitwit: Assigned IP address: 139.59.208.47
==> minitwit: Private IP address: 10.114.0.2
```

Go to the [Digital Ocean admin page for floating IP's](https://cloud.digitalocean.com/networking/floating_ips) and assign 138.68.125.107 to the newly created minitwit server.

---

**NOTE** This could maybe be added to a script.

---

```shell
$ ./run.sh
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
