#!/bin/sh -l

# -----------------------------------
# @author: liusx
# @email: liusx@plopco.com
# @description: 安装 linux 服务
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

echo "Service installing..."

if [ ! -d "$APP_HOME_PATH" ];then
echo "Folder path error"
else
cd $APP_HOME_PATH

if [ ! -f "$BOOTSTRAP_FULL_FILE_NAME" ];then
echo "Create bootstrap file" $BOOTSTRAP_FULL_FILE_NAME
sudo cat>$BOOTSTRAP_FULL_FILE_NAME<<EOF
#!/bin/sh
# chkconfig: 2345 10 90
# description:${project.artifactId} service

echo_help()
{
  echo -e "syntax: sh $CUR_SHELL_NAME start|stop"
}
if [ -z "\$1" ];then
  echo_help
  exit 1
fi
if [ "\$1" == "start" ];then
    #start

    $APP_HOME_PATH/bin/startup.sh $APP_HOME_PATH

elif [ "\$1" == "stop" ];then
    #shutdown

    $APP_HOME_PATH/bin/shutdown.sh $APP_HOME_PATH

else
  echo_help
  exit 1
fi
EOF
#赋予引导脚本文件可执行权限
sudo chmod u+x $BOOTSTRAP_FULL_FILE_NAME

# 添加到系统服务
echo "Create bootstrap Soft link $BOOTSTRAP_FULL_FILE_NAME -> /etc/init.d/$APP_NAME"
sudo ln -s $BOOTSTRAP_FULL_FILE_NAME /etc/init.d/$APP_NAME

echo "Create service $APP_NAME"
sudo chkconfig --add $APP_NAME

echo "Service $APP_NAME created"

else
echo "Service $APP_NAME% exists. To recreate,please execute uninstallService.sh"
fi

fi