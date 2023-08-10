echo -e "\e[36m>>>>>>>>> Configuring NodeJS repos <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m>>>>>>>>> Install NodeJS <<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m>>>>>>>>> add roboshop user <<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[36m>>>>>>>>> create app directory <<<<<<<<\e[0m"
mkdir /app
echo -e "\e[36m>>>>>>>>> download app content <<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
echo -e "\e[36m>>>>>>>>> install npm <<<<<<<<\e[0m"
npm install
echo -e "\e[36m>>>>>>>>> copy systemD content <<<<<<<<\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[36m>>>>>>>>> daemon-reload <<<<<<<<\e[0m"
systemctl daemon-reload
echo -e "\e[36m>>>>>>>>> enable catalogue <<<<<<<<\e[0m"
systemctl enable catalogue
echo -e "\e[36m>>>>>>>>> restart catalogue <<<<<<<<\e[0m"
systemctl restart catalogue
echo -e "\e[36m>>>>>>>>> copy mongo repo file <<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[36m>>>>>>>>> install monogo client <<<<<<<<\e[0m"
yum install mongodb-org-shell -y
echo -e "\e[36m>>>>>>>>> scheema <<<<<<<<\e[0m"
mongo --host mongo-dev.mdevops333.online </app/schema/catalogue.js

