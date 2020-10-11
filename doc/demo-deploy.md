# How to deploy the demo

The page descirbes the different step to follow on an OCP cluster to deploy the demo

### Clone the repo
``` 
git clone https://github.com/jtarte/mesh-apic-demo.git
```

Go inside the cloned repository
```
cd mesh-apic-demo
```

*NB: all the command will be passed from the root of cloned directory*


###  Deploy service operators

Deploy RH service mesh operators
```
./service-mesh-operator/deploy.sh
``` 

###  Pipelines operators

Deploy RH pipelines operators
```
./pipelines-operator/deploy.sh
``` 

### Create service mesh instances

The demo need 2 service mesh contro plane. For the demo, they are hosted on  the same OpenShift isntance, but they could deployed on different instance s if you multiple instances. 

```
./service-mesh/deploy-cp-instance.sh istio-system

./service-mesh/deploy-cp-instance.sh istio-system2

```

### Create project for pipeline 

proivde credentials

```
./scripts/create-project-struct.sh
```

### ensure you have root certificate



### Load pipelines task
```
oc apply -f ./tasks -n a-pipeline-mesh
```

### Load the pipelines
``` 
oc apply -f ./pipelines -n a-pipeline-mesh
```

### Create env var to target env
```
export CLUSTER=crc-local
```

### Deploy Legacy app
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-z-backend/a-z-backend-pr.yaml
```  
test
```
curl --cacert ca-cert/192.168.64.2.nip.io.crt https://z-backend.192.168.64.2.nip.io/invoke
``` 

### Deploy Cloud backend app
```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-backend/a-cloud-backend-pr.yaml
```
test
```
curl  http://cloud-backend.192.168.64.2.nip.io/invoke
``` 

### Deploy Cloud backend app

```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-cloud-frontend-certificate-pr.yaml 
```


```
oc apply -n a-pipeline-mesh -f gitops/$CLUSTER/a-cloud-frontend/a-front-backend-pr.yaml
``` 
test
```
curl  http://cloud-backend.192.168.64.2.nip.io/invoke
``` 













