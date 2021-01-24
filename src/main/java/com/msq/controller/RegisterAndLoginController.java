package com.msq.controller;

import com.msq.entity.Admin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.plugin.liveconnect.SecurityContextHelper;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RegisterAndLoginController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    //去到login.jsp页面
    @GetMapping("/login")
    public String goLogin(){
        return "login";
    }

    //去首页
    @GetMapping("/index")
    public String index(Model model, HttpSession session){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> map = new HashMap<String,Object>();
        session.setAttribute("login",auth.getName());
        model.addAttribute("username",auth.getName());
        return "index";
    }




}
