#!/usr/bin/env bash

COMMIT_MSG_FILE=$1
#
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
issue_number=$(echo ${BRANCH_NAME} | cut -d '-' -f1)
version_number="[0-9]\+.[0-9]\+.[0-9]\+"
BRANCH_VERISON=${BRANCH_NAME#*"/"}
echo ${version_number}
echo ${BRANCH_NAME}

PACKAGE_VERSION=$(cat package.json |
  grep version |
  head -1 |
  awk -F: '{ print $2 }' |
  sed 's/[",]//g' |
  tr -d '[[:space:]]')

if [ $PACKAGE_VERSION == $BRANCH_VERSION ]; then
  echo '패키지 버전과 브랜치 버전이 같습니다.'
  exit ;
else
  {
    echo '패키지 버전을 업데이트 합니다.'
    package version update
    npm --no-git-tag-version version "${PACKAGE_VERSION}"
  }
fi

echo "${PACKAGE_VERSION}"
echo "$npm_package_version"
#while read oldrev newrev refname
#do
#    branch=$(git rev-parse --symbolic --abbrev-ref $refname)
#    if [ "master" = "$branch" ]; then
#        # Do something
#    fi
#done

# package version update
#npm --no-git-tag-version version "${PACKAGE_VERSION}"

#first_line=`head -n1 ${COMMIT_MSG_FILE}`
#
# if [ -z "$first_line" ]; then
#     sed -i ".bak" "1s/^/[#$issue_number] /" ${COMMIT_MSG_FILE}
# fi
