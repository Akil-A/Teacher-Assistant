package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentRepository rep;

    public List<Student> findAll() {
        return rep.findAll();
    }

    @Transactional
    public Student save(Student u) {
        return rep.save(u);
    }

    public Student findOne(Long id) {
        return rep.findOne(id);
    }

    public void delete(Student u) {
        rep.delete(u);
    }
}
