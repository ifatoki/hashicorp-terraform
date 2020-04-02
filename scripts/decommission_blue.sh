#!/bin/bash

main() {
  green_server_version=$(head -n 1 blue-green-state.txt | head -c 1)
  blue_server_version="a"
  if [ $green_server_version = $blue_server_version ]; then
    blue_server_version="b"
  fi
  mv web_server_${blue_server_version}.tf web_server_${blue_server_version}.tf.deactivated
  
  terraform apply -auto-approve
}

main
