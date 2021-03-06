package com.msq.controller;

import com.msq.entity.*;
import com.msq.repository.ReasonRepository;
import com.msq.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private ReasonRepository reasonRepository;


    //去到学生列表页面,查询学生信息，在列表中渲染出来
    //@PreAuthorize("hasRole('admin')")
    @GetMapping("/studentList")
    public String studentList(Model model) {

        //获取到student的值
        List<Student> all = this.studentService.findAll();


        logger.info("学生信息列表，{}", all);

        //判断是否有学生
        if (CollectionUtils.isEmpty(all)) {
            model.addAttribute("msg", "还没有学生！");
            return "list-student";
        }

        //存储前端显示的学生
        List<ShowStudent> sstudents = new ArrayList<>();

        //进行封装成ShowStudent
        for (Student s : all) {
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
            SClass byId = this.sClassService.findById(s.getClassid());

            if (byId == null){
                showStudent.setClassname("该同学没有班级！");
            }else {
                showStudent.setClassname(byId.getClassname());
            }

            //设置宿舍
            Room roomById = this.roomService.findRoomById(s.getRoomid());
            if (roomById == null) {
                showStudent.setRoomname("该学生未安排宿舍！");
            } else {
                showStudent.setRoomname(roomById.getName());
            }
            //设置床
            Bed bed = this.bedService.findBedById(s.getBedid());
            if (bed == null) {
                showStudent.setBedname("该学生没有床位！");
            } else {
                showStudent.setBedname(this.bedService.findBedById(s.getBedid()).getName());
            }

            sstudents.add(showStudent);

        }


        model.addAttribute("students", sstudents);
        model.addAttribute("studentService", studentService);
        return "list-student";
    }

    //去到添加页面
    @GetMapping("/add")
    @PreAuthorize("hasRole('admin')")
    public String addPage(Model model) {

        //获取所有的专业信息
        List<Major> all = this.majorService.findAll();
        //根据专业获取所有的班级信息
        List<SClass> classes = this.sClassService.findClasses();
        model.addAttribute("majors", all);
        model.addAttribute("classes", classes);
        logger.info("班级信息，{}", classes);

        return "add";
    }

    //新增学生
    @GetMapping("/addStudent")
    public String addStudent(@RequestParam("name") String name, @RequestParam("snumber") String snumber, @RequestParam("sex") String sex,
                             @RequestParam("major") String major, @RequestParam("class") String sclass, @RequestParam("room") String room,
                             @RequestParam("bedname") String bedname, Model model) {

        //  添加学生信息，msq，5171912134，女，1，1，5b604，A下
        logger.info("添加学生信息，{}，{}，{}，{}，{}，{}，{}", name, snumber, sex, major, sclass, room, bedname);

        //根据学号来查询学生是否存在，存在则不予添加
        Student numberStudent = this.studentService.findStudentByNumber(snumber);
        logger.info(snumber);
        if (numberStudent != null) {
            model.addAttribute("msg", "该学号已经存在！");

            return "add";
        }

        Student student = new Student();
        student.setSname(name);
        student.setSnumber(snumber);
        student.setSex(sex);
        student.setMajorid(Integer.parseInt(major));
        student.setClassid(Integer.parseInt(sclass));

        Room room1 = this.roomService.findRoomByName(room);
        if (room1 == null) {
            model.addAttribute("msg", "该宿舍不存在，请先添加宿舍");
            return "forward:/add";
        }

        student.setRoomid(room1.getId());
        //添加床位，判断床位是否被占用
        //根据宿舍名字和床位id来判断该床位是否被占用
        Bed bedByRoomNameAndBedname = this.bedService.findBedByRoomNameAndBedname(room, bedname);
        if (bedByRoomNameAndBedname == null) {
            model.addAttribute("msg", "该床位未添加，请先添加床位");
            return "forward:/add";
        }
        if (bedByRoomNameAndBedname.getFlag() == "1") {
            model.addAttribute("msg", "该床位已经被使用");
            return "forward:/add";
        }
        student.setBedid(bedByRoomNameAndBedname.getId());

        //进行学生信息添加
        this.studentService.save(student);
        //添加成功后，更改床位状态
        this.bedService.update(bedByRoomNameAndBedname.getId(), "1");

        //判断宿舍是否已经住满，住满则更改状态为不可用
        Room roomByName = this.roomService.findRoomByName(room);
        List<Bed> bedsByRoomName = this.bedService.findBedsByRoomName(room);
        if (bedsByRoomName.size() >= roomByName.getBedcount()) {
            //更改宿舍状态为不可用
            this.roomService.updateFlag(room, "1");
        }

        return "redirect:/studentList";
    }

    //跳转到修改页面
    @PreAuthorize("hasRole('admin')")
    @GetMapping("/goStudentEdit")
    public String goStudentEdit(Model model, @RequestParam("number") String number) {
        logger.info("要修改的学生学号为，{}", number);

        //通过学号查询学生id
        Student s = this.studentService.findStudentByNumber(number);
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
        if (roomById == null) {
            showStudent.setRoomname("该学生未安排宿舍！");
        } else {
            showStudent.setRoomname(roomById.getName());
        }
        //设置床
        Bed bed = this.bedService.findBedById(s.getBedid());
        if (bed == null) {
            showStudent.setBedname("该学生没有床位！");
        } else {
            showStudent.setBedname(this.bedService.findBedById(s.getBedid()).getName());
        }

        List<Room> allRoom = this.roomService.findAll();
        List<SClass> classes = this.sClassService.findClasses();
        List<Major> majorList = this.majorService.findAll();

        model.addAttribute("student", showStudent);
        model.addAttribute("rooms", allRoom);
        model.addAttribute("majors", majorList);
        model.addAttribute("classes", classes);

        return "student-edit";
    }


    //修改学生
    @PreAuthorize("hasRole('admin')")
    @PostMapping("/editStudent")
    public String editStudent(@RequestParam("name") String name, @RequestParam("snumber") String snumber,
                              @RequestParam("major") int major, @RequestParam("class") int sclass, @RequestParam("room") int room,
                              @RequestParam("bedname") String bedname, Model model) {
        //tdxing，5171912134，1，1，5，A上，{}
        logger.info("修改学生信息，{}，{}，{}，{}，{}，{}", name, snumber, major, sclass, room, bedname);

        //查询房间
        Room roomById = this.roomService.findRoomById(room);
        if (roomById == null) {
            model.addAttribute("msg", "宿舍不存在");
            return "forward:/goStudentEdit";
        }
        //根据房间号和床名查询床位的是否存在
        Bed bedByRoomNameAndBedname = this.bedService.findBedByRoomNameAndBedname(roomById.getName(), bedname);
        logger.info("bed,{}", bedByRoomNameAndBedname);
        if (bedByRoomNameAndBedname == null) {
            model.addAttribute("msg", "床位不存在");
            return "forward:/goStudentEdit";
        }
        //得到床位id
        int bedId = bedByRoomNameAndBedname.getId();
        logger.info("bedid,{}", bedId);
        //根据姓名学号修改学生信息
        this.studentService.updateStudent(name, snumber, major, sclass, room, bedId);
        logger.info("更新成功。。。");

        //更新成功后修改床位状态
        this.bedService.update(bedByRoomNameAndBedname.getId(), "1");

        //判断宿舍是否已经住满，住满则更改状态为不可用
        Room roomByName = this.roomService.findRoomById(room);
        List<Bed> bedsByRoomName = this.bedService.findBedsByRoomName(roomByName.getName());
        if (bedsByRoomName.size() >= roomByName.getBedcount()) {
            //更改宿舍状态为不可用
            this.roomService.updateFlag(roomById.getName(), "1");
        }

        return "redirect:/studentList";
    }

    //删除学生信息，同时将该学生所住的床位状态设置为可用
    @GetMapping("/deleteStudent")
    @PreAuthorize("hasRole('admin')")
    public String deleteStudent(@RequestParam("number") String number) {

        //接受要删除学生的id
        logger.info("要删除的学生的学号为：{}", number);
        //将床位状态修改为0
        Student studentByNumber = this.studentService.findStudentByNumber(number);
        this.bedService.update(studentByNumber.getBedid(), "0");
        //调用删除学生
        this.studentService.deleteStudentByNumber(studentByNumber);

        return "redirect:/studentList";
    }

    //根据学生姓名查询学生
    @RequestMapping("/findStudentByNumber")
    public String findStudentByNumber(@RequestParam("number") String number, Model model) {

        logger.info("要查找的学生学号为：{}", number);
        Student s = this.studentService.findStudentByNumber(number);
        if (s == null) {
            model.addAttribute("msg", "用户不存在");
        } else {

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
            if (roomById == null) {
                showStudent.setRoomname("该学生未安排宿舍！");
            } else {
                showStudent.setRoomname(roomById.getName());
            }
            //设置床
            Bed bed = this.bedService.findBedById(s.getBedid());
            if (bed == null) {
                showStudent.setBedname("该学生没有床位！");
            } else {
                showStudent.setBedname(this.bedService.findBedById(s.getBedid()).getName());
            }

            List<ShowStudent> students = new ArrayList<>();
            students.add(showStudent);
            model.addAttribute("students", students);
        }

        return "list-student";
    }

    //发起审批，换宿舍，换班级，换专业
    @GetMapping("/goReason")
    //@PreAuthorize("hasRole('admin')")
    public String goReason(Model model, @RequestParam("number") String number) {

        logger.info("发起审批的学生学号为，{}", number);

        //通过学号查询学生id
        Student s = this.studentService.findStudentByNumber(number);
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
        if (roomById == null) {
            showStudent.setRoomname("该学生未安排宿舍！");
        } else {
            showStudent.setRoomname(roomById.getName());
        }
        //设置床
        Bed bed = this.bedService.findBedById(s.getBedid());
        if (bed == null) {
            showStudent.setBedname("该学生没有床位！");
        } else {
            showStudent.setBedname(this.bedService.findBedById(s.getBedid()).getName());
        }

        List<Room> allRoom = this.roomService.findAll();
        List<SClass> classes = this.sClassService.findClasses();
        List<Major> majorList = this.majorService.findAll();

        model.addAttribute("student", showStudent);
        model.addAttribute("rooms", allRoom);
        model.addAttribute("majors", majorList);
        model.addAttribute("classes", classes);

        return "shenpi";
    }

    //进行审批提交
    //修改学生
    //@PreAuthorize("hasRole('admin')")
    @PostMapping("/shenpi")
    public String shenpi(@RequestParam("name") String name, @RequestParam("snumber") String snumber,
                         @RequestParam("major") int major, @RequestParam("class") int sclass, @RequestParam("room") int room,
                         @RequestParam("bedname") String bedname, @RequestParam("reason") String reason, Model model) {
        //tdxing，5171912134，1，1，5，A上，{}
        logger.info("学生审批参数信息，{},{},{},{},{},{},{}", name, snumber, major, sclass, room, bedname, reason);

        //将信息添加到审批列表中
        ShenPi shenPi = new ShenPi();
        shenPi.setName(name);
        shenPi.setNumber(snumber);
        shenPi.setFlag("0");//未处理状态
        shenPi.setBedname(bedname);
        shenPi.setClassid(sclass);
        shenPi.setMajorid(major);
        shenPi.setRoomid(room);
        shenPi.setReason(reason);

        logger.info("shenpi,{}", shenPi);

        this.reasonRepository.save(shenPi);


        return "redirect:/goShenPi";
    }

}
