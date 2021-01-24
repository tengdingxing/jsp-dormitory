package com.msq.controller;

import com.msq.entity.Bed;
import com.msq.entity.Room;
import com.msq.service.BedService;
import com.msq.service.RoomService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BedController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private BedService bedService;
    @Autowired
    private RoomService roomService;

    @GetMapping("/goBedList")
    public String goBedList(Model model){
        //获取所有床位信息
        List<Bed> beds = this.bedService.findBeds();
        model.addAttribute("beds",beds);
        logger.info("床位信息列表，{}",beds);
        return "list-beds";
    }

    //根据宿舍查询床位信息
    @GetMapping("/findBedsByName")
    public String findBedsByName(@RequestParam("roomname")String roomname, Model model){
        //根据宿舍查询床位信息
        List<Bed> beds = this.bedService.findBedsByRoomName(roomname);
        model.addAttribute("beds",beds);
        logger.info("该宿舍床位信息，{}",beds);
        return "list-beds";
    }



    //添加床位信息
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/goAddBed")
    public String goAddBed(){
        return "add-bed";
    }

    //添加床位
    @PreAuthorize("hasRole('admin')")
    @PostMapping("/addBed")
    public String addBed(@RequestParam("bedname")String bedname,@RequestParam("roomname")String roomname,Model model){

        //判断该宿舍是否存在，判断该宿舍有多少床位，现在已经有几个了
        Room roomByName = this.roomService.findRoomByName(roomname);
        if (roomByName == null){
            model.addAttribute("msg","不存在该宿舍");
            logger.info("该宿舍不存在，{}",roomname);
            return "add-bed";
        }

        List<Bed> beds = this.bedService.findBedsByRoomName(roomname);
        System.out.println(beds);

        //判断这个宿舍是否还有床位可填加
        if(beds.size() >= roomByName.getBedcount()){
            model.addAttribute("msg","该宿舍已满人，不可添加床位！");
            logger.info("该宿舍不存在，{}",roomname);
            return "add-bed";
        }

        //判断根据床位名判断该宿舍床位是否存在
        for (Bed b:beds) {
            if (b.getName().equals(bedname)){
                model.addAttribute("msg","床位已经存在");
                logger.info("#########,{}",b.getName());
                return "add-bed";
            }
        }



        //保存床位到数据库
        Bed bed = new Bed();
        bed.setFlag("0");
        bed.setName(bedname);
        bed.setRoomname(roomname);
        this.bedService.save(bed);


        return "redirect:/goBedList";
    }

    //删除床位信息
    @GetMapping("/deleteBed/{id}")
    @PreAuthorize("hasRole('admin')")
    public String deleteBed (@PathVariable("id") int id){
        logger.info("要删除的床位id为，{}",id);
        this.bedService.deleteById(id);
        return "redirect:/goBedList";
    }

    //去修改页面
    //修改床为状态
    @GetMapping("/goUpdateBed")
    @PreAuthorize("hasRole('admin')")
    public String updateBedPage(@RequestParam("id")int id,Model model){
        logger.info("要修改的id，{}",id);
        //  this.bedService.updateBed();

        //查出床位信息
        Bed bedById = this.bedService.findBedById(id);

        if (model == null){
            model.addAttribute("msg","要修改的用户已经被删除!");
            return "update-bed";
        }
        model.addAttribute("bed",bedById);
        return "update-bed";
    }

    //修改床为状态
    @PostMapping("/updateBed")
    @PreAuthorize("hasRole('admin')")
    public String updateBed(@RequestParam("flag")String flag, @RequestParam("roomname") String roomname,
                            @RequestParam("bedname")String bedname,Model model){
        //根据房间名，床名来查询bed，判断该床是否已经存在
        Bed bedByRoomNameAndBedname = this.bedService.findBedByRoomNameAndBedname(roomname, bedname);

        this.bedService.update(bedByRoomNameAndBedname.getId(),flag);
        return "redirect:/goBedList";
    }

}
