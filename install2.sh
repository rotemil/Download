#!/usr/bin/env bash
sudo yum update -y 


npm --version
echo " before if "
if [[ $? != 0 ]]; then

    sudo -u ec2-user bash <<EOF
        echo " before curl "
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
        echo " nvm enable "
        . ~/.nvm/nvm.sh
        echo " install node "
        nvm install node

EOF
echo " before else "
else
    echo " npm install "
    npm install -g npm --unsafe-perm=true --allow-root

fi
echo " after fi "
npm audit fix --force

sudo yum install git -y

export HOME=/root
echo " before git "
git clone https://github.com/mrvautin/adminMongo.git /home/ec2-user/adminmongo
echo " after git "
sudo sed -i 's/localhost/0.0.0.0/g' /home/ec2-user/adminmongo/app.js
echo " before CD command "
cd /adminmongo
echo " after CD commend "
#npm install
