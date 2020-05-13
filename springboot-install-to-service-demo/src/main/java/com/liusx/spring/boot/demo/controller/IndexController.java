package com.liusx.spring.boot.demo.controller;

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

    @RequestMapping(value = "",method = {RequestMethod.GET,RequestMethod.POST})
    public String index(){
        return "Hello World";
    }
}
