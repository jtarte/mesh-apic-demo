# Scripts for API management

This directory contains usefull scripts for api management.

* [__*api-discovery.sh*__](./api-discovery.sh) identifies the virtual services in a namespace (provided as parameter) that could be exposed as API.
```
./api-discovery.sh <NAMESPACE_NAME>
```

* [__*api-inventory.sh*__](./api-inventory.sh) list the API that are published in a catalog (passed as parameter) on a APIC instance.
```
./api-inventory.sh <CATALOG_NAME>
```

* [__*api-supersede.sh*__](./api-supersede.sh) supersede a product by another one in a catalog. 
```
./api-supersede.sh <CATALOG_NAME> <PRODUCT_TO_SUPERSEDE> <PRODUCT_SUPERSEDING>

*Pre-reqs*
To execute the discovery script, you should be logged in the Openshift isntance.

To execute the inventory script, you should be logged in the APIC instance and havin exported at bash level the apic server ($server var) and the organisation ($org var).
