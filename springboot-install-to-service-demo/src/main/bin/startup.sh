#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 启动
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

# check server
PIDS=`ps --no-heading -C java -f --width 1000 | grep "$APP_NAME" | awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo -e "ERROR: The $APP_NAME already started and the PID is ${PIDS}."
    exit 1
fi
echo "Starting the $APP_NAME..."

# start

sudo nohup $JRE_HOME/bin/java $JAVA_OPTS -jar $SPRING_PROFILES_ACTIVE $APP_JAR_FILE $APP_NAME > /dev/null 2>&1 &

COUNT=0
  while [ $COUNT -lt 1 ]; do
    sleep 1s
    COUNT=`ps --no-heading -C java -f --width 1000 | grep "$APP_NAME" | awk '{print $2}' | wc -l`
    if [ $COUNT -gt 0 ]; then
      break
    fi
  done
PIDS=`ps --no-heading -C java -f --width 1000 | grep "$APP_NAME" | awk '{print $2}'`
echo "${APP_NAME} Started and the PID is ${PIDS}."