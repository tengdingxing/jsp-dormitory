package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_reason")
@Data
public class ShenPi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "reason")
    private String reason;

    @Column(name = "number")
    private String number; //学号

    @Column(name = "flag")
    private String flag;

    @Column(name = "name")
    private String name;

    @Column(name = "majorid")
    private Integer majorid;

    @Column(name = "classid")
    private Integer classid;

    @Column(name = "roomid")
    private Integer roomid;

    @Column(name = "bedname")
    private String bedname;
}
