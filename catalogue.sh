script_path=$(dirname $0)
source ${script_path}/common.sh
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
component=catalogue
func_nodejs