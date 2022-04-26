#!/bin/bash

DROPLETID=$1

curl -X DELETE \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITAL_OCEAN_TOKEN" \
  -d "{\"resources\":[{\"resource_id\":\"$DROPLETID\",\"resource_type\":\"droplet\"}]}" \
  "https://api.digitalocean.com/v2/tags/application/resources"


echo "Untagged droplet"