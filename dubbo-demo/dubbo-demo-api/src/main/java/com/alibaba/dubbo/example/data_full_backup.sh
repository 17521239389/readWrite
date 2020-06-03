#!/bin/bash
SOURCE_DIR=(
  $*
)
TARGET_DIR=/data/backup/
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
WEEK=`date +%u`
A_NAME=`date +%H%M`
FILES=${A_NAME}_system_back.tgz
CODE=$?
if [ -z "$*" ];then
  echo "请输入需要备份的目录"
  exit
fi

if [ ! -d $TARGET_DIR/$YEAR/$MONTH/$DAY ]; then
    mkdir -p $TARGET_DIR/$YEAR/$MONTH/$DAY
    echo "$TARGET_DIR/$YEAR/$MONTH/$DAY ：目录创建成功"
fi

function  full_backup() {
    if [ "$WEEK" -eq 7 ]; then
        rm -rf $TARGET_DIR/snapshot
        cd $TARGET_DIR/$YEAR/$MONTH/$DAY
        tar -g $TARGET_DIR/snapshot -czvf $FILES ${SOURCE_DIR[@]}
        [ "$CODE" == "0" ] && echo "全量备份成功"
    fi
}
function add_backup() {
    if [ "$WEEK" -ne 7 ]; then
        cd $TARGET_DIR/$YEAR/$MONTH/$DAY
        tar -g $TARGET_DIR/snapshot -czvf $A_NAME$FILES ${SOURCE_DIR[@]}
        [ "$CODE" == "0" ] && echo "增量备份成功"
    fi
}
sleep 3
full_backup;
add_backup