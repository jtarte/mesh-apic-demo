# Upgrade of an internal micro service.

This page describes how to deploy a new version of a API.

First, deploy the microservice and routing configuration in the mesh:
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-cloud-frontend-mesh-api-upgrade-pr.yaml
```

Define the api instance v2.0.0
```
oc apply -f ./gitops/$CLUSTER/apic/publish-api-upgrade-pr.yaml
```

Test the deployment.

```
./gitops/$CLUSTER/test_api.sh 20
./gitops/$CLUSTER/tast_api_v2.sh 20
```

As both API are still published, they still are available.

*Optional*: supersede the previous version 
```
./api-management/api-supersede.sh <CATALOG_NAME> <PRODUCT_TO_SUPERSEDE> <PRODUCT_SUPERSEDING>
```

The v1.0.0 is shown as deprecated in the API portal. The two versions are still available but the v1.0.0 could not be suscribed anymore. 