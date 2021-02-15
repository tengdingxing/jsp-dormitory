package com.msq.controller;

import com.msq.entity.Bed;
import com.msq.entity.Room;
import com.msq.entity.ShowRoom;
import com.msq.service.BedService;
import com.msq.service.RoomService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RoomController {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private RoomService roomService;

    @Autowired
    private BedService bedService;

    //跳转到角色展示页面
    @GetMapping("/goRoomList")
    public String goRoomList(Model model) {

        List<Room> list = this.roomService.findAll();

        if (CollectionUtils.isEmpty(list)) {
            model.addAttribute("msg", "宿舍列表为空！");
            return "list-room";
        }

        List<ShowRoom> showRooms = new ArrayList<>();
        for (Room r : list) {
            ShowRoom showRoom = new ShowRoom();
            showRoom.setBedcount(r.getBedcount());
            showRoom.setFlag(r.getFlag());
            showRoom.setName(r.getName());
            showRoom.setId(r.getId());
            showRoom.setPeople(this.bedService.findBedsByRoomName(r.getName()).size());

            showRooms.add(showRoom);

        }

        model.addAttribute("rooms", showRooms);
        return "list-room";
    }

    //按照宿舍名字搜索宿舍信息
    @GetMapping("/findRoomByName")
    public String findRoomByName(@RequestParam("name") String name, Model model) {
        /* List<Room> roomByName = this.roomService.findRoomByNames(name);*/
        Room room = this.roomService.findRoomByName(name);
        ShowRoom showRoom = new ShowRoom();
        showRoom.setName(room.getName());
        showRoom.setFlag(room.getFlag());
        showRoom.setBedcount(room.getBedcount());
        showRoom.setId(room.getId());
        showRoom.setPeople(this.bedService.findBedsByRoomName(name).size());
        List<Room> roomByName = new ArrayList<>();
        roomByName.add(showRoom);
        model.addAttribute("rooms", roomByName);
        return "list-room";
    }

    //条转到新增页面
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/goAddRoom")
    public String goAddRoom(Model model) {
        return "add-room";
    }

    //新增宿舍
    @PreAuthorize("hasRole('admin')")
    @PostMapping("/addRoom")
    public String addBed(@RequestParam("roomname")String roomname,@RequestParam("bedcount")int count,Model model){

        log.info("新增宿舍的名字和人数，{}，{}",roomname,count);

        //根据宿舍名查询宿舍是否存在
        Room roomByName = this.roomService.findRoomByName(roomname);
        if (roomByName != null){

            model.addAttribute("msg","错误提示：宿舍已经存在，不可添加");
            return "add-room";
        }
        //判断床位数是否大于等于0
        if(count <= 0){
            model.addAttribute("msg","错误提示：床位数不合法");
            return "add-room";
        }

        Room room = new Room();
        room.setBedcount(count);
        room.setName(roomname);
        room.setFlag("0");

        this.roomService.saveRoom(room);

        return "redirect:/goRoomList";
    }

    //删除床位信息
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/deleteRoom/{id}")
    public String delete(@PathVariable("id")int id){

        //删除宿舍要删除该宿舍的所有床位
        Room roomById = this.roomService.findRoomById(id);
        log.info("{},{}",roomById,roomById.getName());
        List<Bed> bedsByRoomName = this.bedService.findBedsByRoomName(roomById.getName());
        for (Bed b : bedsByRoomName){
            this.bedService.deleteById(b.getId());
        }
        //调用删除方法
        this.roomService.deleteRoom(id);
        return "redirect:/goRoomList";
    }

    //条转到新增页面
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/goUpdateRoom")
    public String goUpadte(@RequestParam("id")int id, Model model) {

        //根据id查询room
        Room roomById = this.roomService.findRoomById(id);
        model.addAttribute("room",roomById);
        return "room-edit";
    }

    //进行床位的修改
    @PreAuthorize("hasRole('admin')")
    @PostMapping("/updateRoom")
    public String updateRoom(@RequestParam("roomname")String roomname,@RequestParam("bedcount")int count,Model model) {

        log.info("要修改的宿舍的参数，{}，{}，{}",roomname,count);

        this.roomService.update(roomname,count);

        return "redirect:/goRoomList";
    }
}