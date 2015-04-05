package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CourseController {
    @Autowired
    private CourseService courseServ;

    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public String listCourses(ModelMap model) {
        model.addAttribute("course", new Course());
        model.addAttribute("courses", courseServ.findAll());

        return "course";
    }

    @RequestMapping(value = "/course/add", method = RequestMethod.POST)
    public String addCourse(@ModelAttribute("course") Course course, BindingResult result) {
        courseServ.save(course);

        return "redirect:/course";
    }
}
