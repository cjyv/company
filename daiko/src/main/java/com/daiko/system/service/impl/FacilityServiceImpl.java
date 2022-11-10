package com.daiko.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.FacilityDAO;
import com.daiko.system.service.FacilityService;

@Service
public class FacilityServiceImpl implements FacilityService{
	
	@Inject
     private FacilityDAO fdao;
	
	@Override
	public List<Map<String, Object>> facilitySchedule(Map<String, Object> map,HttpSession session) {
	
	if(map.get("startDay").equals("null")||map.get("endDay").equals("null")) {	
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());	
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		map.put("startDay", sdf.format(calendar.getTime()))  ;
		calendar.add(Calendar.DATE, +7);
	   
		map.put("endDay", sdf.format(calendar.getTime()));
	}
		map.put("e_number", session.getAttribute("e_number"));
		
		return fdao.facilitySchedule(map);
	}
	
	
}
