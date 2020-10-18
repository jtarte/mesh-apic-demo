# Architecture decisions

This page lists the architecture / design decision that has been made for the demo implementation

# Swagger and product definition files
The swagger, including ibm extension, and product description files are provided. No automatic generation of these files are included in thsi demo.

## Unicity of used cluster
For the demo, in order to limit resource, only one cluster instance is used to host all the components (service mesh instances, pipelines, APIC, ...). 

## Launch of pipelines
Pipelines are launched manually. Even if the resources are stored in a GitHub repository, it was decided to not use triggers / webhook to launch pipelines execution. As the used cluster are demo environment, they have a limited life period and using webhook could generate additional work to maintain, udpadet, delete them. 

So the pipeline will be luanched by applying a `PipelineRun` resources. 

# API Lifecycle
This demo doesn't demontrate API lifecycle. No API lifecycle command are integrated in pipelines (except creation/publish). 
A sh script is provided to supersede an API but not used by pipelines. Its usage is for demo purpose and shwo impact of superseded action on the API catalog.

