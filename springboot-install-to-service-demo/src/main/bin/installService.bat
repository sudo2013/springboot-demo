@echo off

rem -----------------------------------
rem @author: liusx
rem @description: 安装为 windows 服务
rem @create: 2020-05-13
rem @repository: https://github.com/l634666/Bat4WindowsService
rem -----------------------------------

rem 设置变量作用域为局部
if "%OS%" == "Windows_NT" setlocal

rem 管理员身份运行，还原当前目录
cd /d %~dp0

:: 引入运行环境
call ./setenv.bat

net.exe session 1>NUL 2>NUL && (
  echo Create service "%APP_NAME%"

  sc query %APP_NAME% >nul && (
    echo Service "%APP_NAME%" exists. To recreate,please execute "uninstallService.bat"
  ) || (
    sc create %APP_NAME% binPath= "%APP_HOME_PATH%\bin\Bat4WindowsService.exe" start= AUTO

	echo Service "%APP_NAME%" created
  )

  TIMEOUT /T 5 /NOBREAK
) || (
  echo Please run as administrators

  TIMEOUT /T 5 /NOBREAK
)