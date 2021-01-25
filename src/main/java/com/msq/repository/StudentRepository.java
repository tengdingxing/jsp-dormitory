package com.msq.repository;

import com.msq.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface StudentRepository extends JpaRepository<Student,Integer> {

    Student findStudentBySnumber(String number);

    @Query("update Student s set s.majorid=?3,s.classid=?4,s.roomid=?5,s.bedid=?6 where s.sname=?1 and s.snumber=?2")
    @Transactional
    @Modifying
    void updateStudent(String name,String number,int major, int sclass, int room, int bedid);


}
