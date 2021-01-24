package com.msq.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "role_admin")
@Data
public class RoleAdmin {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "admin_userid")
    private Integer adminId;
}
