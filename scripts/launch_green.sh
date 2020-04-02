#!/bin/bash

main() {
  if [ $1 = true ]; then 
    green_server_version=a
    mv web_server_b.tf web_server_b.tf.deactivated
  else
    green_server_version=$(head -n 1 blue-green-state.txt | head -c 1)
    if [ $green_server_version = "a" ]; then
      green_server_version="b" 
    else
      green_server_version="a"
    fi
    mv web_server_${green_server_version}.tf.deactivated web_server_${green_server_version}.tf
  fi
  terraform init
  terraform apply -auto-approve
  echo $green_server_version > blue-green-state.txt
}

main $1
