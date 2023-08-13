script_path=$(dirname $0)
mysql_root_password=$1
source ${script_path}/common.sh
dnf module disable mysql -y
cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo
yum install mysql-community-server -y
systemctl enable mysqld
systemctl restart mysqld
mysql_secure_installation --set-root-pass ${mysql_root_password}