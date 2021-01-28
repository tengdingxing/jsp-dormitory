package com.msq.controller;

import com.msq.entity.*;
import com.msq.repository.BedRepository;
import com.msq.repository.MajorRepository;
import com.msq.repository.RoomRepository;
import com.msq.repository.SClassRepository;
import com.msq.service.ShenPiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;

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

            showShenPi.setId(shenPi.getId());
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
}
