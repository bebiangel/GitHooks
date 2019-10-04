#!/usr/bin/env bash

# 현재 브랜치 명
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
VERSION_REGEX="[0-9]+(\.[0-9]+)+"

echo 'CURRENT BRANCH_NAME: ' "${BRANCH_NAME}"

echo "1 : " $(git rev-parse MERGE_HEAD)
echo "2 : " $(git for-each-ref | grep ^$(git rev-parse MERGE_HEAD))
#echo "2 : "$(expr $(git for-each-ref | grep ^$(git rev-parse MERGE_HEAD)) | grep -E -o $VERSION_REGEX)
#TARGET_BRANCH_VERSION=$(expr $BRANCH_NAME | grep -E -o $VERSION_REGEX)

#
if [ $BRANCH_NAME != "master" ]; then
    echo 'master 브랜치가 아닙니다.'
  exit
  else{
    echo 'master 브랜치 '
  }
fi

