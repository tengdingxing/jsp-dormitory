package com.msq.repository;


import com.msq.entity.RoleAdmin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleAdminRepository extends JpaRepository<RoleAdmin,Integer> {

    List<RoleAdmin> findRoleAdminByAdminId(int adminId);
}
