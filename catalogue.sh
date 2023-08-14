script_path=$(dirname $0)
source ${script_path}/common.sh
component=catalogue
func_nodejs
cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb-dev.mdevops333.online </app/schema/catalogue.js