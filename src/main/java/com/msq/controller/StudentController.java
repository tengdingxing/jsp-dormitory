package com.msq.controller;

import com.msq.entity.*;
import com.msq.repository.MajorRepository;
import com.msq.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class StudentController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private MajorService majorService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private SClassService sClassService;
    @Autowired
    private BedService bedService;
    @Autowired
    private RoomService roomService;


    //去到学生列表页面,查询学生信息，在列表中渲染出来
    //@PreAuthorize("hasRole('admin')")
    @GetMapping("/studentList")
    public String studentList(Model model){

        //获取到student的值
        List<Student> all = this.studentService.findAll();


        logger.info("学生信息列表，{}",all);

        //判断是否有学生
        if(CollectionUtils.isEmpty(all)){
            model.addAttribute("msg","还没有学生！");
            return "list-student";
        }

        //存储前端显示的学生
        List<ShowStudent> sstudents = new ArrayList<>();

        //进行封装成ShowStudent
        for (Student s: all){
            ShowStudent showStudent = new ShowStudent();
            //设置名字
            showStudent.setSname(s.getSname());
            //设置学号
            showStudent.setSnumber(s.getSnumber());
            //设置性别
            showStudent.setSex(s.getSex());
            //设置专业
            showStudent.setMajorname(this.majorService.findMajorById(s.getMajorid()).getMajorname());
            //设置班级信息
            showStudent.setClassname(this.sClassService.findById(s.getClassid()).getClassname());
            //设置宿舍
            Room roomById = this.roomService.findRoomById(s.getRoomid());
            if (roomById == null){
                showStudent.setRoomname("该学生未安排宿舍！");
            }else {
                showStudent.setRoomname(roomById.getName());
            }
            //设置床
            Bed bed = this.bedService.findBedById(s.getBedid());
            if (bed == null){
                showStudent.setBedname("该学生没有床位！");
            }else{
            showStudent.setBedname(this.bedService.findBedById(s.getBedid()).getName());
            }

            sstudents.add(showStudent);

        }


        model.addAttribute("students",sstudents);
        model.addAttribute("studentService",studentService);
        return "list-student";
    }

    //去到添加页面
    @GetMapping("/add")
    @PreAuthorize("hasRole('admin')")
    public String addPage(Model model){

        //获取所有的专业信息
        List<Major> all = this.majorService.findAll();
        //根据专业获取所有的班级信息
        List<SClass> classes = this.sClassService.findClasses();
        model.addAttribute("majors",all);
        model.addAttribute("classes",classes);
        logger.info("班级信息，{}",classes);

        return "add";
    }

    //新增学生
    @GetMapping("/addStudent")
    public String addStudent(@RequestParam("name")String name,@RequestParam("snumber")String snumber,@RequestParam("sex")String sex,
                            @RequestParam("major") String major,@RequestParam("class")String sclass,@RequestParam("room")String room,
                             @RequestParam("bedname") String bedname,Model model){

        //  添加学生信息，msq，5171912134，女，1，1，5b604，A下
        logger.info("添加学生信息，{}，{}，{}，{}，{}，{}，{}",name,snumber,sex,major,sclass,room,bedname);

        //根据学号来查询学生是否存在，存在则不予添加
        Student numberStudent = this.studentService.findStudentByNumber(snumber);
        logger.info(snumber);
        if (numberStudent != null){
            model.addAttribute("msg","该学号已经存在！");

            return "add";
        }

        Student student = new Student();
        student.setSname(name);
        student.setSnumber(snumber);
        student.setSex(sex);
        student.setMajorid(Integer.parseInt(major));
        student.setClassid(Integer.parseInt(sclass));

        Room room1 = this.roomService.findRoomByName(room);
        if (room1 == null){
            model.addAttribute("msg","该宿舍不存在，请先添加宿舍");

            return "add";
        }

        student.setRoomid(room1.getId());
        //添加床位，判断床位是否被占用
        //根据宿舍名字和床位id来判断该床位是否被占用
        Bed bedByRoomNameAndBedname = this.bedService.findBedByRoomNameAndBedname(room, bedname);
        if (bedByRoomNameAndBedname == null){
            model.addAttribute("msg","该床位未添加，请先添加床位");
            return "add";
        }
        if (bedByRoomNameAndBedname.getFlag() == "1"){
            model.addAttribute("msg","该床位已经被使用");
            return "add";
        }
        student.setBedid(bedByRoomNameAndBedname.getId());

        //进行学生信息添加
        this.studentService.save(student);
        //添加成功后，更改床位状态
        this.bedService.update(bedByRoomNameAndBedname.getId(),"1");
        return "redirect:/studentList";
    }

    //跳转到修改页面
    @GetMapping("/goStudentEdit")
    public String goStudentEdit(Model model){

        return "student-edit";
    }


}
