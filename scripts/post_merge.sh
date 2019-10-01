#!/usr/bin/env bash

#
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"

echo "${BRANCHNAME}"
echo "${changed_files}"
#
#if ["$BRANCH_NAME" != "master"]; then
#    echo  'master 브랜치'
#    exit
#fi
#
#version_number="[0-9]\+.[0-9]\+.[0-9]\+"
#echo ${version_number}
#echo ${BRANCH_NAME}
#
#PACKAGE_VERSION=$(cat package.json \
#  | grep version \
#  | head -1 \
#  | awk -F: '{ print $2 }' \
#  | sed 's/[",]//g' \
#  | tr -d '[[:space:]]')
#
#echo ${PACKAGE_VERSION}

#first_line=`head -n1 ${COMMIT_MSG_FILE}`
#
# if [ -z "$first_line" ]; then
#     sed -i ".bak" "1s/^/[#$issue_number] /" ${COMMIT_MSG_FILE}
# fi
#BRANCH_NAME='release/3.0.0'
#VERSION_REGEX="release\/(\d+\.)(\d+\.)(\d)"
#
## VERSION=$(curl BRNACH_NAME | grep VERSION_REGEX)
#if [[ $BRANCH_NAME =~ release\/(\d+\.)(\d+\.)(\d) ]]; then
#    echo '일치'
#fi
