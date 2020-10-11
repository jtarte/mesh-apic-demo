# !/bin/bash

FRONTEND=a-cloud-frontend
BACKEND=a-cloud-backend 
LEGACY=a-z-backend
PIPELINE=a-pipeline-mesh
MESH1=istio-system
MESH2=istio-system2

#create the project
echo "Create projects"
oc new-project $FRONTEND
oc new-project $BACKEND
oc new-project $LEGACY
oc new-project $PIPELINE

#add project to mesh controll plane
echo "add project to mesh controll plane"

oc patch smmr default -n $MESH1 --type='json' -p '[{"op": "add", "path": "/spec/members", "value":["'"$BACKEND"'"]}]' 

oc patch smmr default -n $MESH2 --type='json' -p '[{"op": "add", "path": "/spec/members", "value":["'"$FRONTEND"'"]}]' 

#provide priviledges to pipelines
echo "provide privilege to pipeline service account to run pipeline on target projects"
oc adm policy add-role-to-user edit system:serviceaccount:$PIPELINE:pipeline -n $MESH2

oc adm policy add-role-to-user edit system:serviceaccount:$PIPELINE:pipeline -n $LEGACY

oc adm policy add-role-to-user edit system:serviceaccount:$PIPELINE:pipeline -n $BACKEND

oc adm policy add-role-to-user edit system:serviceaccount:$PIPELINE:pipeline -n $FRONTEND


