#!/bin/bash
#mysql -uroot -proot <insert.sql
PS3=请按提示输入
select i in "Nginx" "Mysql" "PHP" "Q"
do
  case $i in
    Nginx )
      echo "正在安装NGINX服务"
      ;;
    Mysql )
      echo "正在安装NGINX服务"
      ;;
    PHP )
      echo "正在安装NGINX服务"
      ;;
    Q )
      exit
      ;;
    * )
      echo "usge  $0 { Nginx | Mysql | PHP }"
    esac
done