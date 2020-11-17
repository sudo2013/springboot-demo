#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 此脚本为环境变量片段，非直接运行文件
# @create: 2020-05-13
# -----------------------------------

# 运行目录，默认为当前运行脚本的目录
APP_HOME_PATH=${1:-$(dirname "$PWD")}
# 引导文件
BOOTSTRAP_FULL_FILE_NAME="$APP_HOME_PATH/bin/bootstrap.sh"
# 应用名称
APP_NAME="${project.artifactId}"
# 日志目录
LOG_HOME="$APP_HOME_PATH/logs"
# 服务器端口
SERVER_PORT="8080"
# 日志级别
LOG_LEVEL="INFO"
# 应用可执行文件
APP_JAR_FILE="$APP_HOME_PATH/bin/${project.artifactId}-${project.version}.jar"
# java 运行库
if [ -d "$APP_HOME_PATH/jre" ]; then
    # 存在内置jre
    JRE_HOME="$APP_HOME_PATH/jre"
elif [ -z "$JRE_HOME" ]; then
    # 系统存在 jdk
    if [ -n "$JAVA_HOME" ]; then
        if [ -d "$JAVA_HOME/jre" ];then
          JRE_HOME="$JAVA_HOME/jre"
        else
            JRE_HOME="$JAVA_HOME"
        fi
    else
       echo "Not found Java runtime environment"
    fi
fi
#JAVA_OPTS=" -server -Xms1024m -Xmx1024m -XX:PermSize=128m"
JAVA_OPTS=" -server -Xms4g -Xmx4g -Xmn2g -Xss512K -Dfile.encoding=utf-8 -Dintmes.runningPath=$APP_HOME_PATH -Dlog.path=$LOG_HOME -Dlog.level=$LOG_LEVEL -Dloader.path=.,$APP_HOME_PATH/bin,$APP_HOME_PATH/lib"
SPRING_PROFILES_ACTIVE=""

export APP_HOME_PATH=$APP_HOME_PATH
export BOOTSTRAP_FULL_FILE_NAME=$BOOTSTRAP_FULL_FILE_NAME
export APP_NAME=$APP_NAME
export APP_JAR_FILE=$APP_JAR_FILE
export JRE_HOME=$JRE_HOME
export SERVER_PORT=$SERVER_PORT
export JAVA_OPTS=$JAVA_OPTS
export SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE
export LOG_HOME=$LOG_HOME