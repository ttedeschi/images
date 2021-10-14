#!/bin/bash

# Configure oidc-agent for user token management
echo "eval \`oidc-keychain\`" >> ~/.bashrc
eval `oidc-keychain`
oidc-gen dodas --issuer $IAM_SERVER \
               --client-id $IAM_CLIENT_ID \
               --client-secret $IAM_CLIENT_SECRET \
               --rt $REFRESH_TOKEN \
               --confirm-yes \
               --scope "openid profile email wlcg wlcg.groups" \
               --redirect-uri  http://localhost:8843 \
               --pw-cmd "echo \"DUMMY PWD\""

while true; do oidc-token dodas --time 1200 > /tmp/token; sleep 600; done &

if [[ -f "/cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh" ]]; then
    source /cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh
    conda activate cms-dodas
    source /cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/bin/thisroot.sh
    #export LD_LIBRARY_PATH=/cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/lib:$LD_LIBRARY_PATH
    export JUPYTER_PATH=/opt/conda/etc/jupyter
    export JUPYTER_CONFIG_DIR=/opt/conda/etc/jupyter
fi