# How to deploy the demo

The page descirbes the different steps to follow on an OCP cluster to deploy the demo, service mesh part.

### Clone the repo

First, clone the repository to get the file locally.
``` 
git clone https://github.com/jtarte/mesh-apic-demo.git
```

Go inside the cloned repository.
```
cd mesh-apic-demo
```

*NB: all the commands will be passed from the root of cloned directory*


### Deploy service operators

Deploy RH service mesh operators.
```
./service-mesh-operator/deploy.sh
``` 

###  Pipelines operators

Deploy RH pipelines operators.
```
./pipelines-operator/deploy.sh
``` 

### Create service mesh instances

The demo need 2 service mesh control planes. For the demo, they are hosted on the same OpenShift instance, but they could deployed on different instances if you have multiple instances. In this case some change could be needed to reflect this multiple instances deployment (service routing for North-South traffic).

```
./service-mesh/deploy-cp-instance.sh istio-system

./service-mesh/deploy-cp-instance.sh istio-system2

```

### Create project for pipeline 

Create the needed projects. The script give also credentials to `pipeline` service account of hosting the pipelines. It allows to manipulate resources of demo projects. 

```
./scripts/create-project-struct.sh
```

### ensure you have root certificate
The demo generates certificates for deployed services. To perform this action, you should have root certificate and key in the `cacert`directory. 

Check that you have the needed files in thsi directory.

If you deploy the demo on a different domain, you should place the certificate and key of the new domain in the directory and push the repo to GIT. The new root certificate will become available for the pipeline.

### Load pipelines task
Load the task used by the pipelines.
```
oc apply -f ./tasks -n a-pipeline-mesh
```

### Load the pipelines
Load the pipelines.
``` 
oc apply -f ./pipelines -n a-pipeline-mesh
```

### Create env var to target env
To simplify the command execution on a multiple environment context, define a var pointing to the directory (in `gitops` directory) of the target environment.
```
export CLUSTER=crc-local
```

### Deploy Legacy app
Deploy the legacy application (tradition openshift app).
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-z-backend/a-z-backend-pr.yaml
```  
Test the deployment.
```
gitops/$CLUSTER/test_legacy.sh 1
``` 

### Deploy Cloud backend app
Deploy the cloud backend application (managed by service mesh).
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-backend/a-cloud-backend-pr.yaml
```
Test the deployment.
```
gitops/$CLUSTER/test_backend.sh 1
``` 

### Deploy Cloud backend app
Generate and deploy the certiifcate used by the service to the mesh ingress gateway.
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-cloud-frontend-certificate-pr.yaml 
```
Deploy the cloud frontend application (managed by service mesh).
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-cloud-frontend-pr.yaml
```
Test the deployment.

```
gitops/$CLUSTER/test_frontend.sh 1
gitops/$CLUSTER/test_frontend_gold.sh 1
``` 











