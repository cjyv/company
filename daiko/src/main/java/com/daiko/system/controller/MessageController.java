package com.daiko.system.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.EmployeeService;
import com.daiko.system.service.MessageService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class MessageController {

	@Inject
    private	EmployeeService employeeservice;
	@Inject
	private MessageService messageservice;
	
	@RequestMapping(value = "message")
	public String message(Model model, HttpSession session) {
		model.addAttribute("e_nubmer", session.getAttribute("e_number"));
		model.addAttribute("contentPage", "message.jsp");
		model.addAttribute("employeeList", employeeservice.employeeList());
		return "index";
	}
	
	@RequestMapping(value = "messageForm")
	public String messageForm(@RequestParam Map<String, Object>map, HttpSession session,Model model) {
		model.addAttribute("b_e_number",map.get("b_e_number") );
		model.addAttribute("profilePhoto", session.getAttribute("profilePhoto"));
		return "popup/messageForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "messageList")
	public List<Map<String, Object>>messageList(@RequestParam Map<String, Object>map, HttpSession session,Model model){
		
		return messageservice.messageList(map, session);
	}
	
	@ResponseBody
	@RequestMapping(value = "messageInsert", method =RequestMethod.POST )
	public void messageInsert(@RequestBody Map<String,Object>map, HttpSession session) {
		JSONPObject jsonpObject = new JSONPObject("b_e_number", map.get("b_e_number"));
		JSONPObject jsonpObject2 = new JSONPObject("b_e_number", map.get("message"));
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("b_e_number", jsonpObject);
		message.put("message", jsonpObject2);
		
		
		messageservice.messageInsert(map, session);
		
	}
	
}
