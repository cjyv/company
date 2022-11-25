package com.daiko.system.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daiko.system.service.CalendarService;

@Controller
public class CalendarController {
	
	@Inject
	private CalendarService calendarservice;
	
	
	@RequestMapping(value = "calendar")
	public String calendar(Model model) {
		
		model.addAttribute("contentPage", "calendar.jsp");
		return "index";
	}
	
	@RequestMapping(value = "calendarForm")
	public String calendarForm(@RequestParam Map<String, Object>map,HttpSession session,Model model) {
		
		map.put("e_number", session.getAttribute("e_number"));
		String lastTime = String.valueOf(map.get("date"));
		lastTime = lastTime+" 23:59:59";
	
		map.put("lastTime", lastTime);
		model.addAttribute("calendarMemoList",calendarservice.calendarMemoList(map) );
		model.addAttribute("calendarFacilityList",calendarservice.calendarFacilityList(map) );
		model.addAttribute("calendarTodoList",calendarservice.calendarTodoList(map) );
		return "popup/calendarForm";
	}
}
