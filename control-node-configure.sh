#!/bin/bash 
set -e 

# checking for arguments 
if [ $# -ne 2 ]
then 
  echo "Error! You need to provide the 2 private IPs of both Managed nodes..."
  exit 1
fi 

sed -i 's/node1 ansible_host="node1_ip"/node1 ansible_host='"$1"'/g' inventory/hosts 
sed -i 's/node2 ansible_host="node2_ip"/node2 ansible_host='"$2"'/g' inventory/hosts 
echo -e "\n$1 node1\n$2 node2" >> /etc/hosts
