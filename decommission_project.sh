#!/bin/bash

main() {
  terraform destroy -auto-approve
  green_server_version=$(head -n 1 blue-green-state.txt | head -c 1)
  blue_server_version="a"
  if [ $green_server_version = $blue_server_version ]; then
    blue_server_version="b"
  fi
  mv web_server_${blue_server_version}.tf.deactivated web_server_${blue_server_version}.tf
  sed -i '' -e '$ d' blue-green-state.txt
  sed -i '' -e '$ d' terraform.tfvars 
  sed -i '' -e '$ d' terraform.tfvars 
  echo "web_server_address_green=\"\"" >> terraform.tfvars
  echo "web_server_zone_id_green=\"\"" >> terraform.tfvars
}

main
