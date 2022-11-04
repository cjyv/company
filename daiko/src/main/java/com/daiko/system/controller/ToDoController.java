package com.daiko.system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToDoController {

	@RequestMapping(value = "todo")
	public String Todo(Model model, HttpSession session) {
		model.addAttribute("contentPage", "todo.jsp");
		return "index";
	}
	
}
