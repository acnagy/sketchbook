#!/bin/bash

echo test process: $test_process

if [ $TRAVIS_TEST_RESULT -eq 0 ]; then
    job_result=success
else 
    job_result=failure
fi

body='{
	"state": "$job_result",
	"description": "travis-ci-tests",
	"target_url": "https://travis-ci.org/acnagy/sketchbook/jobs/$TRAVIS_JOB_ID",
	"context": "$TEST_PROCESS"
}'

curl -X POST "https://api.github.com/repos/acnagy/sketchbook/statuses/${TRAVIS_COMMIT}" \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token ${GH_TOKEN}"
-d "$body" \
