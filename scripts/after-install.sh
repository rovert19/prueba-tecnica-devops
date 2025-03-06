#!/bin/bash
set -xe

aws s3 cp s3://web-devops-bucket/dist /usr/local/webapps/react-app/dist --recursive