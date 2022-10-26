package com.daiko.system;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,  Model model) {
		
		
	if(session.getAttribute("name")==null) {
		return "login";
	}
	else {
		model.addAttribute("contentPage", "home.jsp");
		return "index";
	}
	}
	
}
