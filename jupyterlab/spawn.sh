#!/usr/bin/env bash

curl -d grant_type=urn:ietf:params:oauth:grant-type:token-exchange \
   -u $IAM_CLIENT_ID:$IAM_CLIENT_SECRET \
   -d audience="https://wlcg.cern.ch/jwt/v1/any" \
   -d subject_token=$ACCESS_TOKEN \
   -d scope="openid profile wlcg wlcg.groups" \
   https://cms-auth.web.cern.ch/token \
   | tee /tmp/response | jq .access_token |  tr -d '"' |  tr -d '\n'> /tmp/token

while true; do
    curl -d grant_type=urn:ietf:params:oauth:grant-type:token-exchange \
        -u $IAM_CLIENT_ID:$IAM_CLIENT_SECRET \
        -d audience="https://wlcg.cern.ch/jwt/v1/any" \
        -d subject_token=`cat /tmp/token` \
        -d scope="openid profile wlcg wlcg.groups" \
        https://cms-auth.web.cern.ch/token \
        | tee /tmp/response | jq .access_token |  tr -d '"' |  tr -d '\n'> /tmp/token_tmp \
    && cp /tmp/token_tmp /tmp/token
    sleep 72000
done &


cd /.init

#./sts-wire https://cms-auth.web.cern.ch ${USERNAME} https://131.154.96.201:31631/ /home /mnt/minio --insecureConn --localCache full --tryRemount --noDummyFileCheck --localCacheDir "/opt/user_data/cache/${USERNAME}" > /.init/mount_${USERNAME}.txt &

# if [[ -f "/cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh" ]]; then
#     source /cvmfs/cms.dodas.infn.it/miniconda3/etc/profile.d/conda.sh
#     conda activate af
#     source /cvmfs/cms.dodas.infn.it/miniconda3/envs/af/bin/thisroot.sh
#     #export LD_LIBRARY_PATH=/cvmfs/cms.dodas.infn.it/miniconda3/envs/cms-dodas/lib:$LD_LIBRARY_PATH
#     export JUPYTER_PATH=/opt/conda/etc/jupyter
#     export JUPYTER_CONFIG_DIR=/opt/conda/etc/jupyter
# fi
