package com.daiko.system.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.ToDoService;



@Controller
public class ToDoController {
	
	@Inject
	private ToDoService todoservice;

	@RequestMapping(value = "todo")
	public String ToDo(Model model, HttpSession session) {
	
		model.addAttribute("contentPage", "todo.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "todoList")
	public List<Map<String, Object>> ToDoList(HttpSession session){
		
		
		return todoservice.todoList(session);
	}
	@RequestMapping(value ="todoForm" )
	public String todoForm(@RequestParam int seq,Model model) {
		
		if(seq!=0) {
			Map<String, Object> todoDetailMap = todoservice.todoDetail(seq);
			model.addAttribute("detail", todoDetailMap);
		}
		
		
		return "popup/todoForm";
		
	}
	
}
