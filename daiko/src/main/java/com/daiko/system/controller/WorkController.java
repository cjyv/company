package com.daiko.system.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.EmployeeService;
import com.daiko.system.service.workService;

@Controller
public class WorkController {

	@Inject
	private workService ws;
	@Inject
	private EmployeeService es;
	
	@RequestMapping(value = "work", method = RequestMethod.GET)
	public String work(@RequestParam int type ,Model model) {
		model.addAttribute("type", type);
		model.addAttribute("contentPage", "work.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "worklist",method = RequestMethod.GET)
	public List<Map<String, Object>> list(@RequestParam Map<String, Object>map, Model model, HttpSession session) {
		return ws.list(map, session);
	}
	@RequestMapping(value = "workForm",method = RequestMethod.GET)
	public String workForm(@RequestParam Map<String, Object> map,Model model,HttpSession session) {
		model.addAttribute("title",map.get("title"));
	
		model.addAttribute("name", session.getAttribute("name"));
	
		model.addAttribute("employeeList", es.employeeList());
		
		return "popup/workForm";
	}
	
}
