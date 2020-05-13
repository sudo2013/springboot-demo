@echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@intmes.com
rem @description: 此脚本为环境变量片段，非直接运行文件
rem @create: 2020-05-13
rem @repository: https://github.com/l634666/Bat4WindowsService
rem -----------------------------------

::脚本运行目录
set "CURRENT_DIR=%cd%"
:: 运行目录，默认为当前运行脚本的目录
cd ..
set "APP_HOME_PATH=%cd%"
cd %CURRENT_DIR%
:: 应用名称
set "APP_NAME=${project.artifactId}"
:: 应用可执行文件
set "APP_JAR_FILE=%APP_HOME_PATH%\bin\${project.artifactId}-${project.version}.jar"
:: java 运行库
set "JRE_HOME=%APP_HOME_PATH%\jre"
:: JAVA_OPTS=" -server -Xms1024m -Xmx1024m -XX:PermSize=128m"
set "JAVA_OPTS= -Dloader.path=%APP_HOME_PATH%\lib"
set "SPRING_PROFILES_ACTIVE="