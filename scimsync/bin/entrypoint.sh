#!/usr/bin/env bash

#export OIDC_CONFIG_DIR=$HOME/.oidc-agent

#eval $(oidc-keychain)

#oidc-gen cms --issuer "https://$IAM_SERVER/" \
#    --client-id "$IAM_CLIENT_ID" \
#    --client-secret "$IAM_CLIENT_SECRET" \
#    --rt "$REFRESH_TOKEN" \
#    --confirm-yes \
#    --scope "scim:read" \
#    --redirect-uri http://localhost:8843 \
#    --pw-cmd "echo \"DUMMY PWD\""

exec $@
