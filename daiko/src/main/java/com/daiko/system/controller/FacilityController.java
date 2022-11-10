package com.daiko.system.controller;

import java.util.Calendar;
import java.util.Date;
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

import com.daiko.system.service.FacilityService;

@Controller
public class FacilityController {
	
	@Inject
	private FacilityService fs;
	
	@RequestMapping(value = "facility", method = RequestMethod.GET)
	public String facility(@RequestParam int facilityNo, Model model){
		
		model.addAttribute("facilityNo", facilityNo);
		model.addAttribute("contentPage", "facility.jsp");
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "facilitySchedule")
	public List<Map<String, Object>> facilitySchedule(@RequestParam Map<String,Object>map,HttpSession session){
		System.out.println(fs.facilitySchedule(map, session));
		return fs.facilitySchedule(map, session);
	}
	
}
