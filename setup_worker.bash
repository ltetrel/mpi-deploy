#!/bin/bash

MANAGER_IP=$(cat list_hosts | head -1)
sudo apt-get install nfs-common
sudo mkdir -p /dat
sudo chown ubuntu /dat
echo "${MANAGER_IP}:/dat      /dat      nfs rw,noatime,nolock,hard,tcp 0 0" | sudo tee -a /etc/fstab
sudo mount -a --verbose
