#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 状态查询
# @create: 2020-06-22
# -----------------------------------

## 引入运行环境
BASE_PATH=$1
BIN_PATH=
if [ -n "$BASE_PATH" ]; then
BIN_PATH=$BASE_PATH/bin
else
BIN_PATH=./
fi
source $BIN_PATH/setenv.sh $BASE_PATH

# check server
PIDS=`ps --no-heading -C java -f --width 1000 | grep "$APP_NAME" | awk '{print $2}'`
if [ -n "$PIDS" ]; then
   echo "Service $APP_NAME Started"
else
  echo "Service $APP_NAME Stopped"
fi