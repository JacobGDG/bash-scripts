#!/bin/sh

repo_name=$1
if [ -z $repo_name ]
then
  echo "Repo name required." && exit 1
fi
if [ -z $GIT_TOKEN ]
then
  echo "GIT_TOKEN must be set." && exit 1
fi

curl -H "Authorization: token $GIT_TOKEN" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

echo "Create a new repo at https://github.com/JacobGDG/$repo_name"

git init
git remote add origin "https://github.com/JacobGDG/$repo_name.git"
