#!/bin/bash

main() {
  green_server_version=$(head -n 1 blue-green-state.txt | head -c 1)
  green_lb_address=$(terraform output web_server_${green_server_version}_address)
  green_lb_zone_id=$(terraform output web_server_${green_server_version}_zone_id)

  sed -i '' -e '$ d' terraform.tfvars 
  sed -i '' -e '$ d' terraform.tfvars 
  echo "web_server_address_green=\"${green_lb_address}\"" >> terraform.tfvars
  echo "web_server_zone_id_green=\"${green_lb_zone_id}\"" >> terraform.tfvars

  terraform apply -auto-approve
}

main
