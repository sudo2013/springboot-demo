chcp 65001
@echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@plopco.com
rem @description: 启动
rem @create: 2020-05-13
rem -----------------------------------

rem 设置变量作用域为局部
if "%OS%" == "Windows_NT" setlocal

rem 管理员身份运行，还原当前目录
cd /d %~dp0

:: 引入运行环境
call ./setenv.bat

:: 查找服务进程
for /f "usebackq tokens=1-2" %%a in (`jps -l ^| findstr %APP_NAME%`) do (
    set pid=%%a
)

if not defined pid (
    echo Service %APP_NAME% starting...

	start "" "%JRE_HOME%/bin/javaw" %JAVA_OPTS% -jar %SPRING_PROFILES_ACTIVE% %APP_JAR_FILE% %APP_NAME% 2>&1
)

echo Service %APP_NAME% started

TIMEOUT /T 5 /NOBREAK

exit