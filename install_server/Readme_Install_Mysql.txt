#切换到解压的目录  根据自己的情况找到这个解压目录
root@dell:~# cd /etc/ansible/roles/install_server/
root@dell:~# ls /etc/ansible/roles/install_server/
install_mysql   install_mysql.yaml Readme_Install_Mysql.txt
#执行命令
ansible-playbook ./install_mysql.yaml -i ./install_mysql/hosts -e Version=5.6 -e Server=192.168.1.254

ps:
现在支持 Centos 和 Ubuntu 操作系统 部署方式为二进制部署
把安装Mysql的主机定义到./install_mysql/hosts 中  根据格式定义即可  做免密码交互    命令为 ssh-copy-id -i /root/.ssh/id_rsa.pub root@IP
Version 目前支持两个版本  5.6 or 5.7 8.0 别的输入信息不支持
Server  写hosts定义的主机IP地址即可
