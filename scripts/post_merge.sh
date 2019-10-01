#!/usr/bin/env bash

#
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"

echo 'BRANCH_NAME: ' "${BRANCH_NAME}"
#echo "${changed_files}"
echo "GIT_COMMIT_TO_MASTER: " "${GIT_COMMIT_TO_MASTER}"

echo "1 : " $(git rev-parse MERGE_HEAD)
echo "2 : "$(git for-each-ref | grep ^$(git rev-parse MERGE_HEAD) )
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


  merge_destination_branch=$1
  merge_source_branch=$2

  merge_base=$(git merge-base $merge_destination_branch $merge_source_branch)
  merge_source_current_commit=$(git rev-parse $merge_source_branch)

  echo 'merge_base' "${merge_base}"
  echo 'merge_source_branch' "${merge_source_branch}"
  echo 'merge_source_current_commit' "${merge_source_current_commit}"
