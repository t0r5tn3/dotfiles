#!/bin/bash

# my tiny shell script to create a new local and remote branch which
# may also descend from non-master branches (optional parameter)

BASEBRANCH=master

if [ "X$1" = "X" ]; then
	echo "usage: $0 <new_branch_name> <optional_basebranch_name>"
	exit 
fi

if [ "X$2" != "X" ]; then
	BASEBRANCH=$2
fi

git branch -av

# update basebranch locally
git checkout $BASEBRANCH
git pull

# create local branch from local basebranch
git checkout -b $1

# set upstream and push to remote
git push -u origin $1

git pull
git fetch origin
git branch -av

