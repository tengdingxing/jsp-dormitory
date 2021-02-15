package com.msq.repository;

import com.msq.entity.ShenPi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface ReasonRepository extends JpaRepository<ShenPi,Integer> {

    @Transactional
    void deleteShenPiByNumberAndSid(String number,int id);

    @Transactional
    @Modifying
    @Query("UPDATE ShenPi sp SET sp.flag=?2 where sp.sid=?1")
    void updateFlag(Integer id, String s);
}
