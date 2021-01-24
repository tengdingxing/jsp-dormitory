package com.msq.repository;

import com.msq.entity.SClass;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SClassRepository extends JpaRepository<SClass,Integer> {

    //通过id查班级
    SClass findById(int id);

    //根据专业号获取所有的班级
    List<SClass> findSClassByMajorid(int majorid);
}
