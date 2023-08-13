script_path=$(dirname $0)
source ${script_path}/common.sh
echo ${script_path}
exit
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
rm -rf /app
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
npm install
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service
systemctl daemon-reload
systemctl enable cart
systemctl restart cart
