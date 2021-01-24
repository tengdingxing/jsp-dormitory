package com.msq.service;

import com.msq.entity.Admin;
import com.msq.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;


    public Admin checkLogin(String name ,String password){
        Admin adminByAdminNameAndPassword = this.adminRepository.findAdminByAdminNameAndPassword(name, password);
        return adminByAdminNameAndPassword;
    }
}
