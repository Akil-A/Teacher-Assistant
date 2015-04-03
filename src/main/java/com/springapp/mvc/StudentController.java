package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassService classSer;

    @RequestMapping(value = "/student", method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        model.addAttribute("user", new Student());
        model.addAttribute("users", studentService.findAll());
        model.addAttribute("classList", classSer.findAllNames());

        return "student";
    }

    @RequestMapping(value = "/student/add", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("student") Student stud, BindingResult result, @RequestParam("newClass") String newClass) {
        if (stud.getClassName().equals("NONE")){
            stud.setClassName(newClass);
            Class c = new Class(newClass);
            classSer.save(c);
        }
        studentService.save(stud);

        return "redirect:/student";
    }

    @RequestMapping("/student/delete/{userId}")
    public String deleteStudent(@PathVariable("userId") Long userId) {

        studentService.delete(studentService.findOne(userId));

        return "redirect:/student";
    }
}
