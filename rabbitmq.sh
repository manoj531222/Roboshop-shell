rabbitmq_appuser_password=$1
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
yum install rabbitmq-server -y
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
rabbitmqctl add_user roboshop ${rabbitmq_appuser_password}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"