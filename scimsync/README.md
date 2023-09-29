# Sync k8s HTCondor mapfile with IAM group members

## Quick start

- get a correct kubeconfig on `~/.kube/config`
- generate a IAM client with `scim:read` scope

```
docker run -v ~/.kube/config:/root/.kube/config \
           -e IAM_SERVER=https://cms-auth.web.cern.ch/ \
           -e IAM_CLIENT_SECRET=<iam client secret> \
           -e IAM_CLIENT_ID=<iam client id> \
           -e REFRESH_TOKEN=<refresh token> dodas-ts/iam-scim-map:v0.0.1
```


