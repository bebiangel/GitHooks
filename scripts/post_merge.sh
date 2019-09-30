#!/usr/bin/env bash

COMMIT_MSG_FILE=$1
#
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

if ["$BRANCH_NAME" != "master"]; then
    echo  'master 브랜치'
    exit
fi

version_number="[0-9]\+.[0-9]\+.[0-9]\+"
echo ${version_number}
echo ${BRANCH_NAME}

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo ${PACKAGE_VERSION}

#first_line=`head -n1 ${COMMIT_MSG_FILE}`
#
# if [ -z "$first_line" ]; then
#     sed -i ".bak" "1s/^/[#$issue_number] /" ${COMMIT_MSG_FILE}
# fi
