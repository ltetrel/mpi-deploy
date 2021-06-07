#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential
wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz
tar -xvzf openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
./configure --prefix=$HOME/.local
make -j10 all
make install
cd ..
rm -r openmpi*
echo "export PATH=\$PATH:\$HOME/.local/bin" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$HOME/.local/lib" >> $HOME/.bashrc
source $HOME/.bashrc
