#!/bin/bash

echo $TEST_PROCESS
export body='{
	"state":"success",
	"description":"travis-ci-jobs",
	"target_url":"https://travis-ci.org/acnagy/sketchbook/jobs/'${TRAVIS_JOB_ID}'",
	"context":"'${TEST_PROCESS}'"
}'

curl -X POST "https://api.github.com/repos/acnagy/sketchbook/statuses/${TRAVIS_COMMIT}" \
-d "$body" \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token ${GH_TOKEN}"
echo "Job status posted in commit"