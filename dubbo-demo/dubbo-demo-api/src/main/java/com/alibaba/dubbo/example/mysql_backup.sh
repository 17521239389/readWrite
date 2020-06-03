#!/bin/bash
echo "mysql backup script"

BAK_DIR=/data/backup/`date +%Y%m%d`
MYSQLDB=test
MYSQLUSER=root
MYSQLPWD=root
MYSQLCMD=/usr/local/mysql/bin/mysqldump

if [ $UID -ne 0 ]; then
        echo "must to be use root for exec shell."
        exit
fi

if [ ! -d $BAK_DIR ];then
        mkdir -p $BAK_DIR
        echo -e "\033[32m The $BAK_DIR Create successfully! \033[0m"
else
        echo "This $BAK_DIR is exists.."
fi

$MYSQLCMD -u${MYSQLUSER} -p$MYSQLPWD -d $MYSQLDB >$BAK_DIR/$MYSQLDB.sql
if [ $? -eq 0 ]; then
    echo -e "\033[32m The mysql backup $BAK_DIR successfully \033[0m"
else
    echo -e "\033[32m The mysql backup $BAK_DIR failed \033[0m"
fi