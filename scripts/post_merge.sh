#!/usr/bin/env bash

# 현재 브랜치 명
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
VERSION_REGEX="[0-9]+(\.[0-9]+)+"
MERGED_BRANCH=$(git branch --merged | egrep -v "(^\*|master|dev)")
echo 'CURRENT BRANCH_NAME: ' "${BRANCH_NAME}"
echo 'MERGED_BRANCH_NAME: ' "${MERGED_BRANCH}"
if [ $BRANCH_NAME != "master" ]; then
    echo 'master 브랜치가 아닙니다.'
  exit
fi


branch="${1:-HEAD}"
echo $branch;
branch_name=`git rev-parse --abbrev-ref $branch`;
echo $branch_name;
echo '========================'
merge_base="$(git merge-base $branch origin/dev)"
merge_source_current_commit="$(git rev-parse $branch)"


if [ "$merge_base" != "$merge_source_current_commit" ]; then
    echo -e "${red}Branch with name '$branch_name' is not completely merged with origin/dev.${no_color}";
    exit 1;
else
    echo -e "${green}Branch with name '$branch_name' is merged with origin/dev, now checking against origin/master${no_color}";
fi

merge_base="$(git merge-base $branch origin/master)"

if [ "$merge_base" != "$merge_source_current_commit" ]; then
    echo -e "${red}Branch with name '$branch_name' is not completely merged with orign/master.${no_color}";
    exit 1;
fi


echo -e "${green}branch with name '$branch_name' is completely m
