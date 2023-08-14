app_user=roboshop
script=$(realpath "$0")
script_path=$(dirname "$script")
func_nodejs() {

  curl -sL https://rpm.nodesource.com/setup_lts.x | bash
  yum install nodejs -y
  useradd ${app_user}
  rm -rf /app
  mkdir /app
  curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
  cd /app
  unzip /tmp/${component}.zip
  npm install
  cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
  systemctl daemon-reload
  systemctl enable ${component}
  systemctl restart ${component}
    
}