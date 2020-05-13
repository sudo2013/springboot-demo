#!/bin/sh

# -----------------------------------
# @author: liusx
# @email: liusx@intmes.com
# @description: 此脚本为环境变量片段，非直接运行文件
# @create: 2020-05-13
# @repository: https://github.com/l634666/Bat4WindowsService
# -----------------------------------

# 运行目录，默认为当前运行脚本的目录
APP_HOME_PATH=$(dirname "$PWD")
# 引导文件
BOOTSTRAP_FULL_FILE_NAME="$APP_HOME_PATH/bin/bootstrap.sh"
# 应用名称
APP_NAME=${project.artifactId}
# 应用可执行文件
APP_JAR_FILE=$APP_HOME_PATH/bin/${project.artifactId}-${project.version}.jar
# java 运行库
JRE_HOME=$APP_HOME_PATH/jre
#JAVA_OPTS=" -server -Xms1024m -Xmx1024m -XX:PermSize=128m"
JAVA_OPTS="-Dloader.path=$APP_HOME_PATH/lib"
SPRING_PROFILES_ACTIVE=""

export APP_HOME_PATH=$APP_HOME_PATH
export BOOTSTRAP_FULL_FILE_NAME=$BOOTSTRAP_FULL_FILE_NAME
export APP_NAME=$APP_NAME
export APP_JAR_FILE=$APP_JAR_FILE
export JRE_HOME=$JRE_HOME
export JAVA_OPTS=$JAVA_OPTS
export SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE