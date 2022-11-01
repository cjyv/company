package com.daiko.system.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daiko.system.dto.EmployeeDTO;
import com.daiko.system.service.EmployeeService;

@Controller
public class LoginController {

	@Inject
	private EmployeeService employeeservice;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute EmployeeDTO dto ,Model model, HttpSession session) {
		String name = employeeservice.loginCheck(dto, session);
		if(name == null) {
			model.addAttribute("message", "error");
			return "login";
		}
		else {
			model.addAttribute("name",name);
			model.addAttribute("contentPage", "home.jsp");
		return "index";
		}
	}
	
	@RequestMapping(value = "logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		employeeservice.logOut(session);
		return "login";
	}

}
