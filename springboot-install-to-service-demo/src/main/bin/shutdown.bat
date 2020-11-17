chcp 65001
@echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@plopco.com
rem @description: 停止
rem @create: 2020-05-13
rem -----------------------------------

rem 设置变量作用域为局部
if "%OS%" == "Windows_NT" setlocal

rem 管理员身份运行，还原当前目录
cd /d %~dp0

:: 引入运行环境
call ./setenv.bat

rem 是否自动退出
set "AUTO_EXIT=%1%"
if "%AUTO_EXIT%"=="" (
    set "AUTO_EXIT=1"
)

:: 查找服务进程
for /f "usebackq tokens=1-2" %%a in (`jps -l ^| findstr %APP_NAME%`) do (
    set pid=%%a
    set image_name=%%b
)

if not defined pid (
    echo Service %APP_NAME% not started
) else (
    echo Service %APP_NAME% stopping...

    :: 根据进程ID，kill进程
    taskkill /f /pid %pid%

    echo Service %APP_NAME% stopped
)

if %AUTO_EXIT% gtr 0 (
    TIMEOUT /T 5 /NOBREAK
    exit
)