#!/usr/bin/env bash

# 현재 브랜치 명
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
VERSION_REGEX="[0-9]+(\.[0-9]+)+"

echo 'CURRENT BRANCH_NAME: ' "${BRANCH_NAME}"

#echo "1 : " $(git rev-parse MERGE_HEAD)
#echo "2 : " $(git for-each-ref | grep ^$(git rev-parse MERGE_HEAD))
#echo "2 : "$(expr $(git for-each-ref | grep ^$(git rev-parse MERGE_HEAD)) | grep -E -o $VERSION_REGEX)
#TARGET_BRANCH_VERSION=$(expr $BRANCH_NAME | grep -E -o $VERSION_REGEX)

#
if [ $BRANCH_NAME != "master" ]; then
    echo 'master 브랜치가 아닙니다.'
  exit
fi

  merge_destination_branch=$1
  merge_source_branch=$2

echo $merge_destination_branch
echo $merge_source_branch


  merge_base=$(git merge-base $merge_destination_branch $merge_source_branch)
  merge_source_current_commit=$(git rev-parse $merge_source_branch)

  echo '===================================='
  echo $merge_base
  echo $merge_source_current_commit
  echo '===================================='

  if [[ $merge_base = $merge_source_current_commit ]]
  then
    echo $merge_source_branch is merged into $merge_destination_branch
    return 0
  else
    echo $merge_source_branch is not merged into $merge_destination_branch
    return 1
  fi
