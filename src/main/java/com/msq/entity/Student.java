package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_student")
@Data
public class Student {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "student_number")
    private String snumber;

    @Column(name = "student_name")
    public String sname;

    @Column(name = "sex")
    private String sex;

    @Column(name = "major_id")
    private Integer majorid;

    @Column(name = "class_id")
    private Integer classid;

    @Column(name = "room_id")
    private Integer roomid;

    @Column(name = "bed_id")
    private Integer bedid;
}
