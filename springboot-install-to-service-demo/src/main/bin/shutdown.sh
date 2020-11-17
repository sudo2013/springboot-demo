#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 停止
# @create: 2020-05-13
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

PIDS=`ps --no-heading -C java -f --width 1000 | grep "$APP_NAME" | awk '{print $2}'`
  if [ -z "$PIDS" ]; then
    echo "ERROR:The $APP_NAME does not started!"
    exit 1
  fi
echo -e "Stopping the $APP_NAME..."

for PID in $PIDS; do
    sudo kill $PID > /dev/null 2>&1
done

COUNT=0
while [ $COUNT -lt 1 ]; do
    sleep 1
    COUNT=1
    for PID in $PIDS ; do
      PID_EXIST=`ps --no-heading -p $PID`
      if [ -n "$PID_EXIST" ]; then
        COUNT=0
        break
      fi
    done
done

echo -e "${APP_NAME} Stopped and the PID is ${PIDS}."