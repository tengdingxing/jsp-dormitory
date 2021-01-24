package com.msq.repository;

import com.msq.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,Integer> {

    //根据roleId查询role
    Role findByRoleId(int roleId);

}
