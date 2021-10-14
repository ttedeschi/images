#!/bin/bash

#source /cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh
#conda activate cms-dodas

export PYTHONPATH=/opt/conda/lib/python3.9/site-packages/$PYTHONPATH

#source /cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/bin/thisroot.sh
#export LD_LIBRARY_PATH=/cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/lib:$LD_LIBRARY_PATH
export JUPYTER_PATH=/opt/conda/etc/jupyter
export JUPYTER_CONFIG_DIR=/opt/conda/etc/jupyter

python /usr/local/bin/jupyterhub-singleuser "$@"