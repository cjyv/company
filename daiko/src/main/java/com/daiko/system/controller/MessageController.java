package com.daiko.system.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.EmployeeService;
import com.daiko.system.service.MessageService;

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
		return "popup/messageForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "messageList")
	public List<Map<String, Object>>messageList(@RequestParam Map<String, Object>map, HttpSession session,Model model){
		
		return messageservice.messageList(map, session);
	}
}
