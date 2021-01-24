package com.msq.service;

import com.msq.entity.SClass;
import com.msq.repository.SClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SClassService {

    @Autowired
    private SClassRepository sClassRepository;

    public SClass findById(int id){
        return this.sClassRepository.findById(id);
    }


    public List<SClass> findClasses() {

        return this.sClassRepository.findAll();
    }

    public List<SClass> findClassesByMajorId(Integer majorid) {
        return this.sClassRepository.findSClassByMajorid(majorid);
    }
}
