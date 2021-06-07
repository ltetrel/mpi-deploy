#!/bin/bash

HOSTNAME=$(hostname)
echo "My size is $OMPI_COMM_WORLD_SIZE. My rank is $OMPI_COMM_WORLD_RANK. I am running on $HOSTNAME."
touch hello-mpi
for ii in {1..500}
do
    sha256sum hello-mpi
done
rm hello-mpi
