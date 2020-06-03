#!/bin/bash
email=email.txt
DATE=`date`
IP=`ifconfig enp0s3| grep "broadcast" | awk '{print $2}' | cut -d: -f 2`
count=`ps -ef | grep $1 | grep -v email | grep -v grep | wc -l`
if [ $count -eq 0 ]; then
cat >${email} <<EOF
*************Server Monitor*************
通知类型 ：故障

服务 ：$1

主机 ： $IP

状态 ： 警告

日期 ： $DATE

**************************************
EOF
        mail -s "$IP $1 warning" 17521239389@163.com < ${email} >>/dev/null 2>&1
else
        echo "The $1 server 200 ok"
fi