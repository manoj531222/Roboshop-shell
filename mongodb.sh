cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y
systemctl enable mongod
systemctl start mongod
# need update ip 127.0.1.0 to 0.0.0.0
systemctl restart mongod