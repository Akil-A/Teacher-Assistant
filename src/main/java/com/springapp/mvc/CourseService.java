package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseRepository rep;

    public List<Course> findAll() {
        return rep.findAll();
    }

    public Course findOne(Long courseID) { return rep.findOne(courseID); }

    @Transactional
    public Course save(Course c) {
        return rep.save(c);
    }
}
