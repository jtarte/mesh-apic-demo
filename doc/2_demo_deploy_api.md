# How to deploy API to APIC

The deployment of published API is done with tekton pipelines

The first pipeline `apic-api-deploy`is used to
* create a draft API using a swagger file.
* create a draft Product using a product file. 
* publish the product to a catalog.

To run the pipeline, you could use the `Start`context menu on the pipeline in the Openshift console or use a `PipeLineRun` file.
```
oc apply -f ./gitops/$CLUSTER/apic/publish-api-pr.yaml
```

To test the api, you could use scripts:
```
./gitops/$CLUSTER/test_api.sh 1

./gitops/$CLUSTER/test_api_gold.sh 1
```
*Remarks: in this demo, I separated the deployment from the test phase. IT is a design choice for the demo. In real life, another options / choice, like putting all otgether in one pipeline, could be made.*

