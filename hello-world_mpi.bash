#!/bin/bash

HOSTNAME=$(hostname)
echo "My size is $OMPI_COMM_WORLD_SIZE. My rank is $OMPI_COMM_WORLD_RANK. I am running on $HOSTNAME."
