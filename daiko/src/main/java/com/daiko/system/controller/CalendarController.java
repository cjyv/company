package com.daiko.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping(value = "calendar")
	public String calendar(Model model) {
		
		model.addAttribute("contentPage", "calendar.jsp");
		return "index";
	}
	
}
