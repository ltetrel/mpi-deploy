#!/bin/bash

HOSTNAME=$(hostname)

singularity pull shub://vsoch/hello-world > /dev/null 2>&1
SING_OUTPUT=$(singularity run shub://vsoch/hello-world)
echo "${HOSTNAME}: $((${OMPI_COMM_WORLD_RANK}+1))/${OMPI_COMM_WORLD_SIZE} -- ${SING_OUTPUT}"
