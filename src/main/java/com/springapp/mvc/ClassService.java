package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

public class ClassService {
    @Autowired
    private ClassRepository rep;
    @Autowired
    private CourseService courseServ;

    public List<Class> findAll() {
        return rep.findAll();
    }

    public List<String> findAllNames() {
        ArrayList<String> names = new ArrayList<String>();
        for (Class c : findAll()) names.add(c.getClassName());
        return names;
    }

    public int addCourseToClass(Long courseID, Long classID){
        Class cl = this.findOne(classID);
        Course co = courseServ.find(courseID);
        cl.courses.add(co);
        this.save(cl);
        return cl.courses.size();
    }

    public int removeCourseFromClass(Long courseID, Long classID){
        Class cl = this.findOne(classID);
        Course co = courseServ.find(courseID);
        cl.courses.remove(co);
        this.save(cl);
        return cl.courses.size();
    }

    @Transactional
    public Class save(Class cl) {
        rep.save(cl);
        return cl;
    }

    public Class findOne(Long classID) { return rep.findOne(classID); }

    public Class findOne(String className) {
        for (Class c : findAll())
            if (c.getClassName().equals(className))
                return c;

        return null;
    }

    public Class findOne(Class c) {
        return findOne(c.getClassName());
    }

    public void delete(Class u) {
        rep.delete(u);
    }
}
