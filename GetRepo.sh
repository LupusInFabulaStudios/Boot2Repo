#!/bin/bash

repoName=$(sed "1!d;q" read_file.txt)
repoAddress=$(sed "2!d;q" read_file.txt)

if [ -d "$repoName" ]
then

cd "$repoName"

git pull --no-rebase

else

mkdir "$repoName"
cd "$repoName"

git clone "$repoAddress"

fi
