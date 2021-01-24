package com.msq.repository;

import com.msq.entity.Major;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MajorRepository extends JpaRepository<Major,Integer> {

    //根据id查询专业
    Major findByMajorid(int id);
}
