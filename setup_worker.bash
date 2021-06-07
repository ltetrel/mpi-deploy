#!/bin/bash

sudo apt-get install nfs-common
sudo mkdir -p /dat
sudo chown ubuntu /dat
echo "10.17.1.10:/dat      /dat      nfs rw,noatime,nolock,hard,tcp 0 0" | sudo tee -a /etc/fstab
sudo mount -a --verbose
