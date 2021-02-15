package com.msq.service;

import com.msq.entity.ShenPi;
import com.msq.repository.ReasonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ShenPiService {
    @Autowired
    private ReasonRepository reasonRepository;

    public List<ShenPi> findAllList() {
        return this.reasonRepository.findAll();
    }

    public void delete(String number,int id) {
       this.reasonRepository.deleteShenPiByNumberAndSid(number,id);
    }

    public Optional<ShenPi> findById(int id) {

        return this.reasonRepository.findById(id);
    }

    public void updateFlag(Integer id, String s) {
        this.reasonRepository.updateFlag(id,s);
    }
}
