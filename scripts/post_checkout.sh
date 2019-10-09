#!/usr/bin/env bash

VERSION_REGEX="[0-9]+(\.[0-9]+)+"
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
BRANCH_VERSION=$(expr $BRANCH_NAME | grep -E -o $VERSION_REGEX)
COMMIT_MESSAGE='feat:package.json 버전 업데이트'

if [ "$BRANCH_NAME" == 'master' ]; then
  echo 'master 브랜치입니다.'
  exit
fi

if [ "x""$BRANCH_VERSION" == "x" ]; then
  echo '브랜치 버전이 존재하지 않습니다.'
  exit
fi

PACKAGE_VERSION=$(npm run version --silent)

if [ x"$BRANCH_VERSION" == x ]; then
  echo '브랜치 버전이 맞지 않습니다.'
  exit
fi
if [[ $PACKAGE_VERSION != $BRANCH_VERSION ]]; then
  echo '패키지 버전을 업데이트 합니다.'
  npm --no-git-tag-version version "${BRANCH_VERSION}"
  git add package.json
  git commit -m "$COMMIT_MESSAGE"
else
  {
    echo '패키지 버전과 브랜치 버전이 같습니다.'
  }
fi
