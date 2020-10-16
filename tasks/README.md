# Tasks

This directory contains the tekton tasks used by the [pipelines](../pipelines) of this demo.

* [__*apic-api-test.yaml*__](./apic-api-test.yaml). The task that subscribes the API to the generic `test-app` ans test it. For teh demo, it does a simple test, a call to the API.
* [__*apic-cli.yaml*__](./apic-cli.yaml). The task that is used to make APIC cli command.
* [__*app-deployment.yaml*__](./app-deployment.yaml). The task that deploys the microservices and create kube services. 
* [__*certificate.yaml*__](./certificates.yaml). The task that create the application certificate, store it into a secret and patch the service-mesh ingress gateway. 
* [__*egress.yaml*__](./egress.yaml). The task that updates the yaml file defining the egress configuraton of a service and apply it.
* [__*gateway-deployment.yaml*__](./gateway-deployment.yaml). The task that updates the yaml file defining the ingress gateway configuraton and apply it.
* [__*legacy-route.yaml*__](./legacy-route.yaml). The task that updates the yaml file defining the route to a exteral service (no egress) with TLS originiation and apply it.
* [__*virtualservice-deployment.yaml*__](./virtualservice-deployment.yaml). The task that updates a virtual service and apply it. 