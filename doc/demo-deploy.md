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



