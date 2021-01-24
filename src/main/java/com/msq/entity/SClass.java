package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_class")
@Data
public class SClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_id")
    private Integer id;

    @Column(name = "class_name")
    private String classname;

    @Column(name = "major_id")
    private Integer majorid;


}
