package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ClassController {
    @Autowired
    private ClassService classServ;
    @Autowired
    private CourseService courseServ;

    @RequestMapping(value = "/class", method = RequestMethod.GET)
    public String listClasses(ModelMap model) {
        model.addAttribute("class", new Class());
        model.addAttribute("classes", classServ.findAll());
        model.addAttribute("courses", courseServ.findAll());

        return "class";
    }

    @RequestMapping(value = "/class/add", method = RequestMethod.POST)
    public String addClass(@ModelAttribute("class") Class c, BindingResult result) {
        classServ.save(c);

        return "redirect:/class";
    }
}
