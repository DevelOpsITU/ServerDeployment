#!/bin/bash

# This can be usd to get all ids of droplets with tag "application" - (It is not needed if creating loadbalancer with "tag")
#APPLICATIONDROPLETS=$(curl -s GET \
#  -H "Content-Type: application/json" \
#  -H "Authorization: Bearer $DIGITAL_OCEAN_TOKEN" \
#  "https://api.digitalocean.com/v2/droplets?tag_name=application")


#echo $APPLICATIONDROPLETS | jq '.droplets | .[] | .id'


#### add the load balancer with tag of droplets = "application"
LOADBALANCER=$(curl -X POST \
-H "Content-Type: application/json"  \
-H "Authorization: Bearer $DIGITAL_OCEAN_TOKEN" \
-d '{
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
}' \
"https://api.digitalocean.com/v2/load_balancers")

echo $LOADBALANCER





