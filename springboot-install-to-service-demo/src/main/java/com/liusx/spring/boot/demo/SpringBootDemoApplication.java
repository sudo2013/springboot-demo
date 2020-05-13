package com.liusx.spring.boot.demo;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.XADataSourceAutoConfiguration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @author: liusx
 * @repository: https://github.com/l634666/Bat4WindowsService
 **/
@SpringBootApplication
@EnableAutoConfiguration(exclude = {XADataSourceAutoConfiguration.class, DataSourceAutoConfiguration.class})
@EnableAspectJAutoProxy
public class SpringBootDemoApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootDemoApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
    }
}
