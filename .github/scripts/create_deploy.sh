#!/bin/bash

COMMIT_HASH=`git rev-parse HEAD`
DEPLOYMENT_ID=`aws deploy create-deployment --application-name simple-react-app \
            --deployment-group-name GISimpleReactApp \
            --github-location repository=$GITHUB_REPOSITORY,commitId=$COMMIT_HASH --query deploymentId --output text`

echo "DEPLOYMENT_ID=$DEPLOYMENT_ID" >> $GITHUB_OUTPUT