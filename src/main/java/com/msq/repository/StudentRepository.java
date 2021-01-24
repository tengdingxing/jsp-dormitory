package com.msq.repository;

import com.msq.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student,Integer> {

    Student findStudentBySnumber(String number);

}
