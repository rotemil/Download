#!/usr/bin/env bash
# update installed packages 
sudo -u ec2-user bash
sudo yum update -y 
sudo yum install git -y
export HOME=/root
git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
npm install
cd
# changing localhost to everyone.
sudo sed -i 's/localhost/0.0.0.0/g' /home/ec2-user/adminmongo/app.js
