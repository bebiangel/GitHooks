#!/usr/bin/env bash

# 현재 브랜치 명
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
VERSION_REGEX="[0-9]+(\.[0-9]+)+"
MERGED_BRANCH=$(git branch --merged | egrep -v "(^\*|master|dev)")
MERGED_BRANCH_VERSION=$(expr $MERGED_BRANCH | grep -E -o $VERSION_REGEX)

echo 'CURRENT BRANCH_NAME: ' "${BRANCH_NAME}"
echo 'MERGED_BRANCH_NAME: ' "${MERGED_BRANCH}"
echo 'MERGED_BRANCH_VERSION: ' "${MERGED_BRANCH_VERSION}"
if [ $BRANCH_NAME != "master" ]; then
  echo 'master 브랜치가 아닙니다.'
  exit
fi

if [ "x"${MERGED_BRANCH_VERSION} == "x" ]; then
  echo '브랜치 버전이 존재하지 않습니다.'
  exit
fi

PACKAGE_VERSION=$(cat package.json |
  grep version |
  head -1 |
  awk -F: '{ print $2 }' |
  sed 's/[",]//g' |
  tr -d '[[:space:]]')

if [[ $PACKAGE_VERSION != $MERGED_BRANCH_VERSION ]]; then
  echo '패키지 버전을 업데이트 합니다.'
  npm --no-git-tag-version version ${MERGED_BRANCH_VERSION}
else
  {
    echo '패키지 버전과 브랜치 버전이 같습니다.'
  }
fi
