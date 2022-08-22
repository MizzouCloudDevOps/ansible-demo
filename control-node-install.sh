#!/bin/bash 
set -e 

#Color declarations
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "\n${BLUE}System updating ... ${NC}\n"
yum -y update 
echo -e "\n${GREEN}System update completed ... ${NC}\n"

echo -e "\n${BLUE}Checking for Python installation ... ${NC}\n"
yum list installed python3 
if [ $? -ne 0 ]; then 
  echo -e "\n${BLUE}Python not found. Installing ... ${NC}\n"
  yum -y install python3
  echo -e "\n${GREEN}Python installed successfully... ${NC}\n"
else
  echo -e "\n${GREEN}Python has already been installed ... ${NC}\n"
fi

echo -e "\n${BLUE}Updating epel ... ${NC}\n"
echo y | amazon-linux-extras install epel
echo -e "\n${GREEN}Updating epel finished ... ${NC}\n"

echo -e "\n${BLUE}Installing Ansible ... ${NC}\n"
yum -y install ansible 
if [ $? -ne 0 ]; then 
  echo -e "\n${BLUE}Ansible installation failed ... ${NC}\n"
  exit 1
else
  echo -e "\n${GREEN}Ansible installation finished ... ${NC}\n"
fi

echo -e "\n${BLUE}Setting hostname ... ${NC}\n"
hostnamectl set-hostname ansibleEngine && hostnamectl 
echo -e "\n${GREEN}Hostname changed ... ${NC}\n"

echo -e "\n${GREEN}Ansible Control node has been successfully configured. ${NC}\n"
