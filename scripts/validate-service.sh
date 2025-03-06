#!/bin/bash
set -x

HTTP_CODE=`curl --write-out '%{http_code}' -o /dev/null http://54.198.92.108/`

if [ "$HTTP_CODE" == "200" ]; then
    echo "Web server responses"
    exit 0
fi

echo "Failing Web server"
exit 1
