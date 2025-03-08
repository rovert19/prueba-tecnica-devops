#!/bin/bash
set -x

HTTP_CODE=`curl --write-out '%{http_code}' -o /dev/null http://localhost:80`

if [ "$HTTP_CODE" == "200" ]; then
    echo "Web server responses"
    exit 0
fi

echo "Failing Web server"
exit 1
