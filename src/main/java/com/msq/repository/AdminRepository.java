package com.msq.repository;

import com.msq.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdminRepository extends JpaRepository<Admin,Integer> {

    Admin findAdminByAdminNameAndPassword(String name,String password);

    Admin findAdminByAdminName(String username);
}
