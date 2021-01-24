package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "t_major")
public class Major {

    @Id
    @Column(name = "major_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer majorid;

    @Column(name = "major_name")
    private String majorname;

}
