#  SERVICE MESH & APIC Demo

This repository contains the file neededs to implement a demo about APIC and Service Mesh.

Service mesh microservices application is deployed and publish an API to APIC.

The demo shows how to:
1. Deploy the microservice applications ([step 1](./doc/1_demo_deploy_apps.md)).
2. Publish the exposed interface as API into APIC instance ([step2](/doc/2_demo_deploy_api.md)).
3. Upgrade an internal microservice and demontrate that there is no impact for the API consumer ([step 3](./doc/3_demo_internal_upgrade.md)).
4. Upgrade an API into APIC ([step 4](./doc/4_demo_api_upgrade.md)).

Some choices have been made for the design of the demo. These decisions are traced in [this page](./doc/archi_decisions.mds) 

The demo uses:
* Openshift Container Platform. The demo has been tested on OCP 4.4 & 4.5 and on CRC 1.16.
* APIC v10.
