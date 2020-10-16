# Pipelines

This directory contains the tekton pipelines used in ths demo.

* [__*apic-api-deploy.yaml*__](./apic-api-deploy.yaml). The pipeline that deploys the draft API, the draft product and publish the product to a APIC catalog.
* [__*apic-api-test.yaml*__](./apic-api-test.yaml). The pipeline that tests the availability of the API.
* [__*cert-demo-pipeline.yaml*__](./cert-demo-pipeline.yaml). The pipeline that publish certificate to the ingress gateway of a service mesh.
* [__*deploy-backend-pipeline.yaml*__](./deploy-backend-pipeline.yaml). The pipeline that deploys the cloud backend application.
* [__*deploy-frontend-pipeline.yaml*__](./deploy-frontend-pipeline.yaml). The pipeline that deploys the cloud frontend application.
* [__*deploy-legacy-pipeline.yaml*__](./deploy-legacy-pipeline.yaml). The pipeline that deploys the legacy (no service mesh) application.


It contains also the resources that are used by theses pipelines.
* [__*git-resource.yaml*__](./git-resources.yaml). The git (this one) that contains the resources used by the pipelines.
* [__*image-resource.yaml*__](./image-resources.yaml). The docker image used to create the microservices of the different applications
