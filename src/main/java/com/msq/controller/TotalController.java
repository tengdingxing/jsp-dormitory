package com.msq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TotalController {

    @GetMapping("/echarts6")
    public String goTotalPage(){
        return "echarts";

    //进行统计，按班级，性别，专业

    }
}
