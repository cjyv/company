package com.daiko.system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	@RequestMapping(value = "message")
	public String message(Model model, HttpSession session) {
		
		model.addAttribute("contentPage", "message.jsp");
		return "index";
	}
}
