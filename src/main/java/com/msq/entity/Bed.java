package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_bed")
public class Bed {

    @Id
    @Column(name = "bed_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "bed_name")
    private String name;

    @Column(name = "room_name")
    private String roomname;

    @Column(name = "flag")
    private String flag;

}
