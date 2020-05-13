@echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@intmes.com
rem @description: 重新启动
rem @create: 2020-05-13
rem @repository: https://github.com/l634666/Bat4WindowsService
rem -----------------------------------

rem 设置变量作用域为局部
if "%OS%" == "Windows_NT" setlocal

rem 管理员身份运行，还原当前目录
cd /d %~dp0

:: 引入运行环境
call ./setenv.bat

rem 停止，传入"0"代表取消自动退出，此处必须传入小于"1"的
rem 数字，否则"./startup.bat"脚本则会被终止执行
call ./shutdown.bat 0

rem 启动
call ./startup.bat