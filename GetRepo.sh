#!/bin/bash

pip3 install pipreqs

cd /boot

if [ -f "repo.b2r" ]
then

repoName=$(sed "1!d;q" repo.b2r)
repoAddress=$(sed "2!d;q" repo.b2r)

else

echo
echo "ERROR: No repo.b2r file was found on the boot directory. Please add a repo.b2r file to the boot directory and try again."
exit 1

fi

cd /home/Boot2Repo

if [ -d "$repoName" ]
then

cd "$repoName"

echo $(pwd)

git pull --no-rebase

else

mkdir "$repoName"
cd "$repoName"

echo $(pwd)

git clone "$repoAddress"

fi

cd $(ls | head -n 1)

echo $(pwd)
sudo pipreqs $(pwd) --force
pip3 install -r "requirements.txt"

python3 main.py
