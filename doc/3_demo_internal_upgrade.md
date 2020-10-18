# Upgrade of an internal micro service.

This page describes how to deploy a new version of a micro service, internal to the API app.

```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-cloud-frontend-internal_upgrade-pr.yaml
```

Test the deployment.

```
gitops/$CLUSTER/test_api.sh 20
```
Depending of the weight you have define in the virtual service, you should see, in the response, calls to `service-c v1` and `service v2`.

