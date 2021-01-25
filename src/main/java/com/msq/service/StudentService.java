package com.msq.service;

import com.msq.entity.Student;
import com.msq.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> findAll(){

        List<Student> all = this.studentRepository.findAll();
        return all;
    }

    public void save(Student student) {
        this.studentRepository.save(student);
    }

    public Student findStudentByNumber(String snumber) {
        return this.studentRepository.findStudentBySnumber(snumber);
    }

    public void updateStudent(String name, String snumber, int major, int sclass, int room, int bedid) {
        this.studentRepository.updateStudent(name, snumber, major, sclass, room, bedid);
    }

    public void deleteStudentByNumber(Student s) {

        this.studentRepository.delete(s);
    }
}
