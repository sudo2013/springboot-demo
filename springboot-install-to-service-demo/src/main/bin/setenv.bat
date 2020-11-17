echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@plopco.com
rem @description: 此脚本为环境变量片段，非直接运行文件
rem @create: 2020-05-13
rem -----------------------------------

::脚本运行目录
set "CURRENT_DIR=%cd%"
:: 运行目录，默认为当前运行脚本的目录
cd ..
set "APP_HOME_PATH=%cd%"
cd %CURRENT_DIR%
:: 服务器端口
set "SERVER_PORT=8080"
:: 应用名称
set "APP_NAME=${project.artifactId}"
:: 日志目录
set "LOG_HOME=%APP_HOME_PATH%\logs"
:: 日志级别
set "LOG_LEVEL=INFO"
:: 应用可执行文件
set "APP_JAR_FILE=%APP_HOME_PATH%\bin\${project.artifactId}-${project.version}.jar"

rem java 运行库
if exist "%APP_HOME_PATH%\jre" (
    set "JRE_HOME=%APP_HOME_PATH%\jre"
) else (
  if not defined JRE_HOME (
    if defined JAVA_HOME (
      set "JRE_HOME=%JAVA_HOME%\jre"
    ) else (
      echo Not found Java runtime environment
      pause
    )
  )
)

:: JAVA_OPTS=" -server -Xms1024m -Xmx1024m -XX:PermSize=128m"
set "JAVA_OPTS= -server -Xms4g -Xmx4g -Xmn2g -Xss512K -Dfile.encoding=utf-8 -Dintmes.runningPath=%APP_HOME_PATH% -Dlog.path=%LOG_HOME% -Dlog.level=%LOG_LEVEL% -Dloader.path=.,%APP_HOME_PATH%\bin,%APP_HOME_PATH%\lib"
set "SPRING_PROFILES_ACTIVE="