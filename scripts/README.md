# Scripts

This directory contains various scripts that are used by the demo. This scripts could be used directly (CLI) or are used by pipeline tasks.

* [__*create-project_struct.sh*__](./create-project_struct.sh). This script is used to create the projects structure of the demo. It creates the projects, add projects on service mesh control plane and grant to pipeline service account the privilege to the project.
* [__*generate_tls.sh*__](./generate_tls.sh). The scriot that is used to generate application certificate.
* [__*operator.sh*__](./operator.sh). The script that contains the function de deploy or remove an operator. This script is used by operator deploy script.
 

