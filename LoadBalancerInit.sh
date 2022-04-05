#!/bin/bash

APPLICATIONDROPLETS=$(curl -s GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  "https://api.digitalocean.com/v2/droplets?tag_name=application")


echo $APPLICATIONDROPLETS | jq '.droplets | .[] | .id'

#### add the load balancer with ids of droplets
#LOADBALANCER=(curl --location --request POST 'https://api.digitalocean.com/v2/load_balancers' \
#--header 'Content-Type: application/json' \
#--header 'Authorization: Bearer dop_v1_97bee0ef8458c86b9e70477371fd114d00d957eb25bb274b9c2b24bbd652d444' \
#--data-raw '{
#  "name": "example-lb-01",
#  "region": "nyc3",
#  "forwarding_rules":
#    [ {}, {} ],
#  "droplet_ids":
#    [ 3164444, 3164445 ]
#}')





