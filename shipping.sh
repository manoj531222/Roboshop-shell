yum install maven -y
useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
mvn clean package
mv target/shipping-1.0.jar shipping.jar
yum install mysql -y
mysql -h mysql-dev.mdevops333.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service
echo """""""hellooooo"""""""""
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping