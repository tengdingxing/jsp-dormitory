package com.msq.controller;

import com.msq.entity.*;
import com.msq.repository.*;
import com.msq.service.ShenPiService;
import com.msq.service.StudentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.Column;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ShenPiController {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ShenPiService shenPiService;

    @Autowired
    private SClassRepository sClassRepository;

    @Autowired
    private BedRepository bedRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private MajorRepository majorRepository;

    @Autowired
    private StudentRepository studentRepository;

    //去到审批页面
    @GetMapping("/goShenPi")
    public String goShenPi(Model model){

        List<ShenPi> shenPiList = this.shenPiService.findAllList();

        if (CollectionUtils.isEmpty(shenPiList)){
            model.addAttribute("msg","列表为空!");
            return "list-shenpi";
        }
        log.info("审批列表:{}",shenPiList);

        //集合转换
        List<ShowShenPi> list = new ArrayList<>();
        for (ShenPi shenPi: shenPiList) {
            ShowShenPi showShenPi = new ShowShenPi();

            showShenPi.setSid(shenPi.getSid());
            showShenPi.setBedname(shenPi.getBedname());
            //判断审批班级
            Optional<SClass> byId = this.sClassRepository.findById(shenPi.getClassid());
            if (byId == null){
               showShenPi.setClassname("错误的班级！");
            }else {
               showShenPi.setClassname(byId.get().getClassname());
            }
            //判断专业
            Major byMajorid = this.majorRepository.findByMajorid(shenPi.getMajorid());
            if (byMajorid == null){
                showShenPi.setMajorname("错误的专业！");
            }else {
                showShenPi.setMajorname(byMajorid.getMajorname());
            }
            //房间号
            Room roomById = this.roomRepository.findRoomById(shenPi.getRoomid());
            if (roomById == null){
                showShenPi.setRoomname("错误的房间！");
            }else {
                showShenPi.setRoomname(roomById.getName());
            }

            showShenPi.setNumber(shenPi.getNumber());
            showShenPi.setFlag(shenPi.getFlag());
            showShenPi.setReason(shenPi.getReason());
            showShenPi.setBedname(shenPi.getBedname());
            showShenPi.setName(shenPi.getName());

            list.add(showShenPi);
        }

        model.addAttribute("shenPiList",list);

        return "list-shenpi";
    }

    //批准审批
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/confirm")
    public String updateShenPi(@RequestParam("number")String number,@RequestParam("sid")String id,Model model){
        //根据审批信息找到审批信息，再去修改学生专业，班级，宿舍床位
        Optional<ShenPi> optionalShenPi =this.shenPiService.findById(Integer.parseInt(id));
        ShenPi shenPi = optionalShenPi.get();//得到审批对象
        log.info("审批对象：{}",shenPi);
        //判断审批是否已经处理
        if (shenPi.getFlag().equals("1")){
            model.addAttribute("msg","改审批已经受理，无需重复受理！");
            return "forward:/goShenPi";
        }


        //获取专业id
        Integer majorid = shenPi.getMajorid();
        //获取班级id
        Integer classid = shenPi.getClassid();
        //获取班级宿舍
        Integer roomid = shenPi.getRoomid();
        //获取床位名字
        String bedname = shenPi.getBedname();

        //判断宿舍和床是否为可用状态
        //1.先找到宿舍
        Room roomById = this.roomRepository.findRoomById(roomid);
        //找到床铺
        Bed byRoomnameAndName = this.bedRepository.findByRoomnameAndName(roomById.getName(), bedname);

        if (roomById.getFlag()=="1" || byRoomnameAndName.getFlag() == "1"){
            model.addAttribute("msg","宿舍或床位已经为使用状态！");
            return "list-shenpi";
        }
        //进行学生表的修改，，专业，班级，宿舍，床位

        log.info("条件：{},{},{},{},{}",number,majorid,roomid,classid,byRoomnameAndName.getId());
        this.studentRepository.updateShenPiStudent(number,majorid,classid,roomid,byRoomnameAndName.getId());

        //更改审批状态
        this.shenPiService.updateFlag(shenPi.getSid(),"1");

        return "redirect:/studentList";
    }

    //删除审批
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/deleteSp")
    public String deleteShenPi(@RequestParam("number")String number,@RequestParam("sid")String id){
        log.info("删除审批的学号{},编号为{}",number,id);
        this.shenPiService.delete(number,Integer.parseInt(id));
        return "redirect:/goShenPi";
    }
}
