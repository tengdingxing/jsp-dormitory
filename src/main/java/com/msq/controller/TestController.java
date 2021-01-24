package com.msq.controller;

import com.msq.repository.AdminRepository;
import com.msq.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @Auther: dongbao
 * @Date: 2018/9/3 10:25
 * @Description:
 */
@Controller
public class TestController {

    @Autowired
    private AdminRepository adminRepository;

    @Value("application.hello")
    private String hello;


    //http://localhost:8081/index
/*   *//* @RequestMapping("/index")
    @ResponseBody
    public String index(Map<String,Object>map){
        System.out.println(hello);
        map.put("hello",this.adminRepository.findAll());
        return "index"+this.adminRepository.findAll();*//*
    }*/

    @RequestMapping("/testpermission")
    @ResponseBody
    @PreAuthorize("hasRole('admin')")
    public String test(){
        System.out.println(hello);
        return "你有admin权限";
    }
}
