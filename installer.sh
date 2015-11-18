#!/bin/bash

cd installer
echo $Date
echo -e "----------------菜单-------------------"
echo
echo -e "\e[1;31m[1] [ Config  Environment  ]\e[0m"
echo -e "\e[1;36m[2] [ Install ZabbixDB     ]\e[0m"
echo -e "\e[1;35m[3] [ Install ZabbixServer ]\e[0m"
echo -e "\e[1;37m[4] [ Install ZabbixAgent  ]\e[0m"
#echo [6] [      ]
echo -e "---------------------------------------"
echo -e "\e[1;33m输入要执行的任务: \e[0m"
read Number

case $Number in 
    
    "1" )
        cd roles/control/files/
        rpm -q ansible || yum localinstall ansible-1.9.4-1.el6.noarch.rpm -y
        rpm -q httpd 2>/dev/null|| yum localinstall httpd
        #echo "存在ansible,httpd两个包说明环境OK..."
        cd -
        ansible-playbook -i hosts control.yml
    ;;  
    "2" )
        ansible-playbook -i hosts mysql.yml
    ;;
    "3" )
        ansible-playbook -i hosts zabbix_server.yml
    ;;
    "4" ) 
        ansible-playbook -i hosts zabbix_agent.yml
    ;;
    *)
        echo "usage {1|2|3|4}..."
    ;;
esac
exit 0 

