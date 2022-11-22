package com.daiko.system.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalendarController {
	
	
	
	@RequestMapping(value = "calendar")
	public String calendar(Model model) {
		
		model.addAttribute("contentPage", "calendar.jsp");
		return "index";
	}
	
	@RequestMapping(value = "calendarForm")
	public String calendarForm(@RequestParam Map<String, Object>map,HttpSession session) {
		
		
		return "popup/calendarForm";
	}
}
