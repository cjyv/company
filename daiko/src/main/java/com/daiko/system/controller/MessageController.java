package com.daiko.system.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daiko.system.service.EmployeeService;

@Controller
public class MessageController {

	@Inject
    private	EmployeeService employeeservice;
	
	@RequestMapping(value = "message")
	public String message(Model model, HttpSession session) {
		
		model.addAttribute("contentPage", "message.jsp");
		model.addAttribute("employeeList", employeeservice.employeeList());
		return "index";
	}
	
	@RequestMapping(value = "messageForm")
	public String messageForm(@RequestParam Map<String, Object>map, HttpSession session ) {
		return "popup/messageForm";
	}
}
