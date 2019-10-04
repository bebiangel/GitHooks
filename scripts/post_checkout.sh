#!/usr/bin/env bash

#VERSION_REGEX="\bv?[0-9]+\.[0-9]+\.[0-9]+(?:\.[0-9]+)?\b"
VERSION_REGEX="[0-9]+(\.[0-9]+)+"
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
echo $BRANCH_NAME | grep -E -o $VERSION_REGEX
BRANCH_VERSION=$(expr $BRANCH_NAME | grep -E -o $VERSION_REGEX)
#
#echo 'BRANCH_NAME : ' ${BRANCH_NAME}
#echo 'BRANCH_VERSION : ' ${BRANCH_VERSION}
#

if [ "x"${BRANCH_VERSION} == "x" ]; then
  echo '브랜치 버전이 존재하지 않습니다.'
  exit;
fi

PACKAGE_VERSION=$(cat package.json |
  grep version |
  head -1 |
  awk -F: '{ print $2 }' |
  sed 's/[",]//g' |
  tr -d '[[:space:]]')

echo $PACKAGE_VERSION
if [ $BRANCH_NAME == 'master' ]; then
    echo 'master 브랜치입니다.'
    exit;
fi
if [ xBRANCH_VERSION == x ]; then
  echo '브랜치 버전이 맞지 않습니다.'
  exit
fi
if [[ $PACKAGE_VERSION != $BRANCH_VERSION ]]; then
  echo '패키지 버전을 업데이트 합니다.'
  npm --no-git-tag-version version ${BRANCH_VERSION}
else
  {
    echo '패키지 버전과 브랜치 버전이 같습니다.'
  }
fi

#echo "${PACKAGE_VERSION}"
#echo "$npm_package_version"
