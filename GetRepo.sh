#!/usr/bin/sudo bash

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

cd $(ls | head -n 1)

git pull --no-rebase

else

mkdir "$repoName"
cd "$repoName"

git clone "$repoAddress"

cd $(ls | head -n 1)

fi

pipreqs $(pwd) --force
pip3 install -r "requirements.txt"

sudo python3 main.py
