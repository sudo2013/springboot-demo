package com.liusx.spring.boot.demo.controller;

import com.liusx.spring.boot.demo.common.RuntimeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: liusx
 * @repository: https://github.com/l634666/Bat4WindowsService
 **/
@RestController
@RequestMapping(value = {"","/"})
public class IndexController {

    @Autowired
    private RuntimeInfo runtimeInfo;

    @RequestMapping(value = "",method = {RequestMethod.GET,RequestMethod.POST},produces = {MediaType.TEXT_HTML_VALUE})
    public String index(){
        StringBuilder sb = new StringBuilder("<html><head><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n" +
                "\t\t<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\"></head><body>");

        sb.append("<br/><h3>运行目录：" + runtimeInfo.getRunningPath() + "</h3>");
        sb.append("</br><h3>是否jar方式运行：" + runtimeInfo.isPackageJar() + "</h3>");
        sb.append("</body></html>");

        return sb.toString();
    }
}
