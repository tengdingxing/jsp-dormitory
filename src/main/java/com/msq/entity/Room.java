package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_room")
@Data
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Integer id;

    @Column(name = "room_name")
    private String name;

    @Column(name = "flag")
    private String flag;

    @Column(name = "bedcount")
    private Integer bedcount;

}
