package com.daiko.system.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WorkController {

	@RequestMapping(value = "work", method = RequestMethod.GET)
	public String work(@RequestParam int type ,Model model) {
		model.addAttribute("type", type);
		model.addAttribute("contentPage", "work.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public List<Map<String, Object>> list(@RequestParam Map<String, Object>map, Model model, HttpSession session) {
		
		return null;
	}
	
}
