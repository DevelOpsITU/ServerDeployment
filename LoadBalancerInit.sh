#!/bin/bash

# This can be usd to get all ids of droplets with tag "application" - (It is not needed if creating loadbalancer with "tag")
#APPLICATIONDROPLETS=$(curl -s GET \
#  -H "Content-Type: application/json" \
#  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
#  "https://api.digitalocean.com/v2/droplets?tag_name=application")


#echo $APPLICATIONDROPLETS | jq '.droplets | .[] | .id'


#### add the load balancer with ids of droplets
LOADBALANCER=(curl --location --request POST 'https://api.digitalocean.com/v2/load_balancers' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer dop_v1_97bee0ef8458c86b9e70477371fd114d00d957eb25bb274b9c2b24bbd652d444' \
--data-raw '{
  "name": "application-lb",
  "region": "fra1",
  "forwarding_rules":
    [ {
       "entry_protocol": "http",
       "entry_port": 80,
       "target_protocol": "http",
       "target_port": 80
       },
       {
       "entry_protocol": "https",
       "entry_port": 443,
       "target_protocol": "https",
       "target_port": 443,
       "tls_passthrough": true
       } ],
  "tag": "application"
}')





