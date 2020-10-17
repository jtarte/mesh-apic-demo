# How to deploy API to APIC

The deployment of published API is done with tekton pipelines

The first pipeline `apic-api-deploy`is used to
* create a draft API using a swagger file.
* create a draft Product using a product file. 
* publish the product to a catalog.

To run the pipeline, you could use the `Start`context menu on the pipeline in the Openshift console or use a `PipeLineRun` file.
```
oc apply -f 
```

The second pipeline, `apic-api-test` make a test of the published API by
* creating a subscription to the API on a existing application.
* doing a basic call to the API.

The current test is more a availabilty test. It call the HTTP and check if a HTTP 200 is received. No functional testest for the moment.

To run the pipeline, you could use the `Start`context menu on the pipeline in the Openshift console or use a `PipeLineRun` file.
```
oc apply -f 
```

