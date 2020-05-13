#!/bin/sh

# -----------------------------------
# @author: liusx
# @email: liusx@intmes.com
# @description: 停止
# @create: 2020-05-13
# @repository: https://github.com/l634666/Bat4WindowsService
# -----------------------------------

## 引入运行环境
source ./setenv.sh

PIDS=`ps --no-heading -C $JRE_HOME/bin/java -f --width 1000 | grep $APP_NAME | awk '{print $2}'`
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