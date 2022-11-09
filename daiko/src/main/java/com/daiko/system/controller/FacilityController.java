package com.daiko.system.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FacilityController {

	
	@RequestMapping(value = "facility", method = RequestMethod.GET)
	public String facility(@RequestParam int facilityNo, Model model){
		
		model.addAttribute("facilityNo", facilityNo);
		model.addAttribute("contentPage", "facility.jsp");
		return "index";
	}
	
	@RequestMapping(value = "facilitySchedule")
	public List<Map<String, Object>> facilitySchedule(){
		return null;
	}
	
}
