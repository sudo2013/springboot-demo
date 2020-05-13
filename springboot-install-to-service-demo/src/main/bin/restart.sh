#!/bin/sh

# -----------------------------------
# @author: liusx
# @email: liusx@intmes.com
# @description: 重新启动
# @create: 2020-05-13
# @repository: https://github.com/l634666/Bat4WindowsService
# -----------------------------------

## 引入运行环境
source ./setenv.sh

# 停止
./shutdown.sh
sleep 2
#启动
./startup.sh