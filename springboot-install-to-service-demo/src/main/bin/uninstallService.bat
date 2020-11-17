chcp 65001
@echo off

rem -----------------------------------
rem @author: liusx
rem @email: liusx@plopco.com
rem @description: 卸载 windows 服务
rem @create: 2020-05-13
rem -----------------------------------

rem 设置变量作用域为局部
if "%OS%" == "Windows_NT" setlocal

rem 管理员身份运行，还原当前目录
cd /d %~dp0

:: 引入运行环境
call ./setenv.bat

net.exe session 1>NUL 2>NUL && (
  echo Uninstall "%APP_NAME%"

  sc query %APP_NAME% >nul && (
	sc delete %APP_NAME%

	echo Service "%APP_NAME%" uninstalled
  ) || (
    echo Service "%APP_NAME%" not exists
  )

  TIMEOUT /T 5 /NOBREAK
) || (
  echo Please run as administrators

  TIMEOUT /T 5 /NOBREAK
)