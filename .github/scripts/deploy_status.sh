#!/bin/bash

while true;
do
    STATUS=`aws deploy get-deployment --deployment-id ${{ steps.create-deployment.outputs.DEPLOYMENT_ID }} --query "deploymentInfo.[status]" --output text`
    echo "Current status: $STATUS"

    if [ "$STATUS" == "Succeeded" ]; then
        echo "Successful deployment"
        exit 0
    elif [ "$STATUS" == "Failed" || "$STATUS" == "Stopped" ]; then
        echo "Failed deployment"
        exit 1
    fi
    sleep 10
done