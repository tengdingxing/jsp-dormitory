package com.msq.service;

import com.msq.entity.Major;
import com.msq.repository.MajorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorService {

    @Autowired
    private MajorRepository majorRepository;

    //根据id查询专业
    public Major findMajorById(int id){

        Major byMajorid = this.majorRepository.findByMajorid(id);
        return byMajorid;
    }

    //获取所有的专业信息
    public List<Major> findAll(){
        List<Major> all = this.majorRepository.findAll();
        return all;
    }
}
