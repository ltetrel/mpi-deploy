#!/bin/bash

HOSTNAME=$(hostname)
TESTFILE=${OMPI_COMM_WORLD_RANK}_${HOSTNAME}.img

fallocate -l 100M $TESTFILE
for ii in {1..3}
do
    sha256sum $TESTFILE > /dev/null
done
rm $TESTFILE

echo "${HOSTNAME}: $((${OMPI_COMM_WORLD_RANK}+1))/${OMPI_COMM_WORLD_SIZE} finished!"
