package com.msq.service;

import com.msq.entity.ShenPi;
import com.msq.repository.ReasonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShenPiService {
    @Autowired
    private ReasonRepository reasonRepository;

    public List<ShenPi> findAllList() {
        return this.reasonRepository.findAll();
    }
}
