#!/bin/bash

sudo cp -f Boot2Repo.service /etc/systemd/system
sudo cp -f GetRepo.sh /home

sudo systemctl enable Boot2Repo
sudo systemctl daemon-reload

echo "Boot2Repo is now installed on your machine and will run on the next reebot. To uninstall it, run UninstallB2R.sh."
echo "To update Boot2Repo, simply download your desired version and run its SetupB2R.sh"
