#!/bin/bash

echo $TEST_PROCESS

if [ $TRAVIS_TEST_RESULT -eq 0 ]; then
	export JOB_RESULT=success
else 
	export JOB_RESULT=failure
fi

export body='{
	"state":"'${JOB_RESULT}'",
	"description":"travis-ci-tests",
	"target_url":"https://travis-ci.org/acnagy/sketchbook/jobs/'${TRAVIS_JOB_ID}'",
	"context":"'${TEST_PROCESS}'"
}'

curl -X POST "https://api.github.com/repos/acnagy/sketchbook/statuses/${TRAVIS_COMMIT}" \
-d "$body" \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token ${GH_TOKEN}"
