#!/bin/bash

sudo apt-get install nfs-kernel-server
echo "/dat `hostname -I | awk '{print $1}' | grep -Po '(\d+\.){3}'`0/24(rw,sync,no_root_squash,no_all_squash)" | sudo tee -a /etc/exports
sudo mkdir -p /dat
sudo chown ubuntu /dat
duso chmod u+rwx /dat
sudo systemctl enable nfs-kernel-server
sudo systemctl restart nfs-kernel-server
cp * /dat/
