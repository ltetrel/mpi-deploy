# mpi-deploy
[Open MPI](https://www.open-mpi.org/) and [Singularity](https://sylabs.io/guides/3.0/user-guide/index.html) deployment scripts.

# Confgure and install

## Cloning
First, log-in to your node that will be the manager.
You can then clone this repository and cd into it:
```
ssh USER@MANAGER_IP
git clone https://github.com/ltetrel/mpi-deploy
cd mpi-deploy
```

## Hosts
Add all the hosts (manager and worker IP) into the `list_hosts` file at the root of this repo, the first line should be the manager IP.

## Install
Still in the manager node,  run `./install_manager.bash`.
This will configure a nfs storage for all nodes, install `singularity` and `Open MPI` on the manager machine.
To configure and install all workers, simply run `./install_workers.bash`.

# running mpi
Even after adding `mpi` into the path (in the `.bashrc`), the system still has trouble to find it.
To fix that, specify where it relies on the host(s) using the `--prefix`.

If you are using a supported resource manager (like [SLURM](https://slurm.schedmd.com/documentation.html)), `Open MPI` will get the slot information from it.
In the other case you will need to maually add the nodes with `--host` (or inside a file with `--hostfile`) and [specify the number of available slots](https://www.open-mpi.org/faq/?category=running#slots-without-hostfiles).

For example, you can run the hello-world script that is provided by th this repo:
```
mpirun --prefix $HOME/.local -np 20 --host 192.168.2.1:${CPU_1},192.168.2.2:${CPU_2} /dat/hello-world_mpi.bash
```

# Going further
Check the [Open MPI tutorials](https://mpitutorial.com/tutorials/running-an-mpi-cluster-within-a-lan/) if you are curious.
