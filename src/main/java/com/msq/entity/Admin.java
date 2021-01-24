package com.msq.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "admin_user")
public class Admin implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_userid")
    private Integer adminId;

    @Column(name = "admin_name")
    private String adminName;

    @Column(name = "admin_password")
    private String password;
}
