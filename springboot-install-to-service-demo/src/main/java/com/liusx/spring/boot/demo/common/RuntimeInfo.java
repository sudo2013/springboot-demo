package com.liusx.spring.boot.demo.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationHome;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
public class RuntimeInfo {

    private static Logger logger = LoggerFactory.getLogger(RuntimeInfo.class);
    /**
     * 运行相关目录
     */
    private ApplicationHome home = new ApplicationHome(getClass());
    /**
     * 运行目录
     */
    private String runningPath;

    /**
     * 是否打包为jar
     */
    private boolean packageJar;

    {
        //获取运行目录
        File source = home.getSource();
        String sourcePath = "";

        if (source == null) {
            //SpringBootTest
            sourcePath = new File(home.getDir().getPath(), "/target/classes").getPath();
        } else {
            sourcePath = source.getPath();
        }

        if (sourcePath.endsWith(".jar")) {
            //当前为jar运行
            packageJar = true;

            //去除 jar 文件名
            File sourceParent = source.getParentFile();
            if (sourceParent != null) {
                sourcePath = sourceParent.getPath();
                if (sourcePath.endsWith("/bin") || sourcePath.endsWith("\\bin")) {
                    //去除bin目录，即工作目录
                    sourcePath = sourceParent.getParentFile().getPath();
                }
            }
        }

        //jar运行目录
        runningPath = sourcePath;
    }

    public String getRunningPath() {
        return runningPath;
    }

    public boolean isPackageJar() {
        return packageJar;
    }
}
