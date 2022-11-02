package com.daiko.system.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daiko.system.dto.EmployeeDTO;
import com.daiko.system.service.EmployeeService;

@Controller
public class EmployeeController {

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
			model.addAttribute("e_number", session.getAttribute("e_number"));
			model.addAttribute("contentPage", "home.jsp");
		return "index";
		}
	}
	
	@RequestMapping(value = "logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		employeeservice.logOut(session);
		return "login";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(@ModelAttribute EmployeeDTO dto, Model model,HttpSession session) {
		
		Map<String, Object> profile = employeeservice.profile(dto, session);
		model.addAttribute("profile", profile);
		model.addAttribute("contentPage", "profile.jsp");
		return "index";
	}

}
