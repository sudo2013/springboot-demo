#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 卸载 linux 服务
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

echo "Service $APP_NAME uninstalling..."

if [ ! -d "$APP_HOME_PATH" ];then
echo "Folder path error"
else
cd $APP_HOME_PATH

if [ -f "$BOOTSTRAP_FULL_FILE_NAME" ];then
    echo "Delete bootstrap file $BOOTSTRAP_FULL_FILE_NAME"
    sudo rm -f $BOOTSTRAP_FULL_FILE_NAME
fi

if [ -L "/etc/init.d/$APP_NAME" ];then
    echo "Delete bootstrap soft link /etc/init.d/$APP_NAME"
    sudo rm -f /etc/init.d/$APP_NAME
fi

echo "Delete service $APP_NAME"
sudo chkconfig --del $APP_NAME

echo "Service $APP_NAME uninstalled"
fi