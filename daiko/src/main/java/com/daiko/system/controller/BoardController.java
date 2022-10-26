package com.daiko.system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	
	@RequestMapping(value = "notice",method = RequestMethod.GET )
	public String notice(HttpSession session,Model model) {
		model.addAttribute("contentPage", "notice.jsp");
		return "index";
	}
	
	
}
