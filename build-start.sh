#!/usr/bin/env bash

# ./build-start.sh $auth $git-sha1 $travis-url

echo $1 # basic auth # nicoskaralis:JXQw3RjNxnsgQeAaJKVu
echo $2 # git rev-parse HEAD
echo $3 # $TRAVIS_JOB_WEB_URL

curl -X "POST" "https://api.bitbucket.org/2.0/repositories/anfeli/han-ios-app/commit/$2/statuses/build" \
  -d "{ \"state\": \"INPROGRESS\", \"url\": \"$3\", \"key\": \"travis-ci\" }" \
  -H 'Content-Type: application/json' -u "$1"
