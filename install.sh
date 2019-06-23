#!/usr/bin/env bash
# update installed packages 
#sudo -u ec2-user bash
#sudo yum update -y 
#sudo yum install git -y
#export HOME=/root
#git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
#. ~/.nvm/nvm.sh
#npm install -g npm --unsafe-perm=true --allow-root
#cd
# changing localhost to everyone.
#sudo sed -i 's/localhost/0.0.0.0/g' /home/ec2-user/adminmongo/app.js
# Install redis-commander and it's dependencies
sudo yum install git -y
export HOME=/root
git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo
npm --version
if [[ $? != 0 ]]; then
    sudo -u ec2-user bash <<EOF
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
        . ~/.nvm/nvm.sh
        nvm install node
EOF
else
    npm install -g npm --unsafe-perm=true --allow-root
fi
