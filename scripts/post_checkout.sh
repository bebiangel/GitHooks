#!/usr/bin/env bash

COMMIT_MSG_FILE=$1
#
branch_name=`git rev-parse --abbrev-ref HEAD`
issue_number=`echo ${branch_name} | cut -d '-' -f1`
version_number="[0-9]\+.[0-9]\+.[0-9]\+"
echo ${version_number}
echo ${branch_name}

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo $PACKAGE_VERSION

#first_line=`head -n1 ${COMMIT_MSG_FILE}`
#
# if [ -z "$first_line" ]; then
#     sed -i ".bak" "1s/^/[#$issue_number] /" ${COMMIT_MSG_FILE}
# fi
