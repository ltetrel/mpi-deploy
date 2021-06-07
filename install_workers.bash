#!/bin/bash

IPS=$(tac list_hosts | head -4)
for IP in $IPS
do
  scp list_hosts $IP:~/
  scp setup_worker.bash $IP:~/
	ssh $IP "bash setup_worker.bash"
	ssh $IP "touch /dat/$IP"
	ssh -n -f $IP "sh -c 'nohup /dat/install_mpi.bash > /dev/null 2>&1 &'"
done
