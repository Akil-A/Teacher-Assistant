package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

public class ClassService {
    @Autowired
    private ClassRepository rep;

    public List<Class> findAll() {
        return rep.findAll();
    }

    public List<String> findAllNames() {
        ArrayList<String> names = new ArrayList<String>();
        for (Class c : findAll()) names.add(c.getClassName());
        return names;
    }

    @Transactional
    public Class save(Class u) {
        if (findOne(u) == null) rep.save(u);
        return u;
    }

    public Class findOne(Long classID) { return rep.findOne(classID); }

    public Class findOne(String className) {
        for (Class c : findAll()) if (c.getClassName().equals(className)) return c;
        return null;
    }

    public Class findOne(Class c) {
        return findOne(c.getClassName());
    }

    public void delete(Class u) {
        rep.delete(u);
    }
}
