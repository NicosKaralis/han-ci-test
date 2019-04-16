#!/usr/bin/env bash

# ./build-end.sh $auth $result $git-sha1 $travis-url

echo $1 # basic auth # nicoskaralis:JXQw3RjNxnsgQeAaJKVu
echo $2 # $TRAVIS_TEST_RESULT
echo $3 # git rev-parse HEAD
echo $4 # $TRAVIS_JOB_WEB_URL

if [[ $2 eq '0' ]]; then
  echo 'Igual a zero'
  $STATUS='SUCCESSFUL'
else
  echo 'Diferente de 0'
  $STATUS='FAILED'
fi

curl -X "POST" "https://api.bitbucket.org/2.0/repositories/anfeli/han-ios-app/commit/$3/statuses/build" \
  -d "{ \"state\": \"$STATUS\", \"url\": \"$4\", \"key\": \"travis-ci\" }" \
  -H 'Content-Type: application/json' -u "$1"
