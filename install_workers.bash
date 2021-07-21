#!/bin/bash

N_HOSTS=$(cat list_hosts | wc -l)
IPS=$(tac list_hosts | head -$(expr ${N_HOSTS} - 1))
MANAGER_IP=$(cat list_hosts | head -1)
for IP in $IPS
do
        scp setup_worker.bash $IP:~/
        ssh $IP "bash setup_worker.bash ${MANAGER_IP}"
        ssh $IP "touch /dat/$IP"
        ssh -n -f $IP "sh -c 'nohup /dat/install_mpi.bash > /dat/mpi_logs_$IP && echo "OpenMPI installed on $IP\!" 2>&1 &'"
        ssh -n -f $IP "sh -c 'nohup /dat/install_singularity.bash > /dat/sing_logs_$IP && echo "Singularity installed on $IP\!" 2>&1 &'"
done
echo ""
