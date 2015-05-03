package com.springapp.mvc;

import javax.persistence.*;

@Entity(name = "course")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long courseID;

    @Basic
    private String courseCode;

    @Basic
    private String courseName;

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public long getCourseID() {
        return courseID;
    }

    public void setCourseID(long courseID) {
        this.courseID = courseID;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public boolean equals(Course cou){
        return this.courseID == cou.courseID;
    }

    @Override
    public boolean equals(Object o){
        Course c = (Course)o;
        return this.courseID == c.courseID;
    }
}
