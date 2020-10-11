function clean_operator
{
    echo "removing" $1 "operator"
    RESOURCE=$(oc get subscription $1 -n openshift-operators -o template --template '{{.status.currentCSV}}')
    if [ "$RESOURCE" != "<no value>" ]
    then 
        oc delete subscription $1 -n $NAMESPACE
        sleep 1
        oc delete clusterserviceversion $RESOURCE -n $NAMESPACE
        echo $1 "operator is removed from environment"
    fi
    sleep 5
}

function deploy_operator()
{
    oc apply -f $1 -n $NAMESPACE

    sleep 2
    # get the csv name
    RESOURCE=$(oc get subscription $2 -n openshift-operators -o template --template '{{.status.currentCSV}}')
    LOOP="TRUE"
    while [ $LOOP == "TRUE" ]
    do
        sleep 5
        # get the status of csv 
        RESP=$(oc get csv $RESOURCE --no-headers 2>/dev/null)
        RC=$(echo $?)
        STATUS=""
        if [ "$RC" -eq 0 ]
        then
            STATUS=$(oc get csv $RESOURCE -o template --template '{{.status.phase}}')
            RC=$(echo $?)
        fi
        # Check the CSV state
        if [ "$RC" -eq 0 ] && [ "$STATUS" == "Succeeded" ]
        then
            echo $2 "operator is deployed"
            LOOP="FALSE" 
        else
            echo "waiting for Succeeded state"
        fi 
    done
}