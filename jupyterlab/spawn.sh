#!/usr/bin/env bash

export OIDC_CONFIG_DIR=$HOME/.oidc-agent

# Configure oidc-agent for user token management
# Ref: https://indigo-dc.gitbook.io/oidc-agent/user/oidc-keychain
echo -e "\nexport OIDC_CONFIG_DIR=$HOME/.oidc-agent" >>~/.bashrc
echo -e "\neval \`oidc-keychain\`" >>~/.bashrc

eval $(oidc-keychain)

oidc-gen dodas --issuer "$IAM_SERVER" \
    --client-id "$IAM_CLIENT_ID" \
    --client-secret "$IAM_CLIENT_SECRET" \
    --rt "$REFRESH_TOKEN" \
    --confirm-yes \
    --aud "$MINIO_AUDIENCE" \
    --scope "openid profile email wlcg wlcg.groups" \
    --redirect-uri http://localhost:8843 \
    --pw-cmd "echo \"DUMMY PWD\""

while true; do
    oidc-token dodas --aud "https://wlcg.cern.ch/jwt/v1/any" --time 1200 >/tmp/token
    sleep 600
done &


cd /.init

./sts-wire https://cms-auth.web.cern.ch ${USERNAME} https://131.154.96.201:31631/ /home /mnt/minio --insecureConn --localCache full --tryRemount --noDummyFileCheck --localCacheDir "/opt/user_data/cache/${USERNAME}" > /.init/mount_${USERNAME}.txt &

if [[ -f "/cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh" ]]; then
    source /cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh
    conda activate af
    source /cvmfs/cms.dodas.infn.it/miniconda3/envs/af/bin/thisroot.sh
    #export LD_LIBRARY_PATH=/cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/lib:$LD_LIBRARY_PATH
    export JUPYTER_PATH=/opt/conda/etc/jupyter
    export JUPYTER_CONFIG_DIR=/opt/conda/etc/jupyter
fi
