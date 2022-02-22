# ServerDeployment

Configuration files that describes how the servers are deployed.

This guide have been used to setup the config file [https://github.com/devopsgroup-io/vagrant-digitalocean](https://github.com/devopsgroup-io/vagrant-digitalocean)

## Setup

- Install [VirtualBox](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)
- Install Digital Ocean plugin

``` shell
vagrant plugin install vagrant-digitalocean
```

## Deployment

To deploy the server on Digital ocean there are a few settings that needs to be set.

- DIGITAL_OCEAN_TOKEN: Key retrieved from Digital ocean.
- SSH_KEY_NAME

```shell
export DIGITAL_OCEAN_TOKEN=SuperSecretKey
```

```shell
export SSH_KEY_NAME=~./.ssh/id_rsa
```
