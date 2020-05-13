# springboot-install-to-service-demo

# 配置项

## setenv.bat | setenv.sh

`JRE_HOME` -- jre 所在目录，路径不包括 `bin`

更多选项请阅读文件内注释


# 应用打包

执行 `mvn clean package` 后将生成

`springboot-install-to-service-demo-1.0.0-bin.tar.gz` linux 
`springboot-install-to-service-demo-1.0.0-bin.zip` windows


## 打包后的目录结构

``` lua
|-- bin 可执行文件  
	|-- application.yml -- springboot 配置文件
    |-- Bat4WindowsService.exe -- 注册到 windwos 服务所需的代理
    |-- Bat4WindowsService.exe.config -- 注册到 windwos 服务的配置
    |-- installService.bat -- 安装为系统服务，windows 系统
    |-- installService.sh -- 安装为系统服务，linux 系统
    |-- restart.bat -- 重启，windows 系统
    |-- restart.sh  -- 启动，linux 系统
    |-- setenv.bat  -- 配置，windows 系统
    |-- setenv.sh  -- 配置，linux 系统
    |-- shutdown.bat  -- 停止，windows 系统
    |-- shutdown.sh  -- 停止，linux 系统
	|-- springboot-install-to-service-demo-1.0.0.jar -- springboot 打包后的jar
    |-- startup.bat  -- 启动，windows 系统
    |-- startup.sh  -- 启动，linux 系统
    |-- uninstallService.bat  -- 从系统服务卸载，windows 系统 
    |-- uninstallService.sh  -- 从系统服务卸载，linux 系统 
|-- lib 所有依赖项jar
	|-- ...
```

