package com.springapp.mvc;

import javax.persistence.*;
import java.util.List;

@Entity(name = "class")
public class Class {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long classID;

    @Basic
    private String className;

    @ManyToMany(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.ALL}
    )
    @JoinTable(
            name="class_course",
            joinColumns={@JoinColumn(name="classID")},
            inverseJoinColumns={@JoinColumn(name="courseID")}
    )
    public List<Course> courses;

    public List<Course> getCourses(){return courses;}

    public Class(){}

    public Class(String className){
        this.className = className;
    }

    public Long getClassID(){
        return classID;
    }

    public void setClassID(Long classID) {
        this.classID = classID;
    }

    public String getClassName(){
        return className;
    }

    public void setClassName(String n){
        className = n;
    }
}
