package com.daiko.system.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
		//schedule logic mine
		Calendar calendar  = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd(E)");
		
		if (map.get("startDay").equals("null")) {
			calendar.setTime(new Date());		
			
		}
		else {
			String startDay = String.valueOf(map.get("startDay"));
		
			
			try {
				Date date = sdf.parse(startDay);
				calendar.setTime(date);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		Map<String, Object>daysMap = new HashMap<String, Object>();
		List <Object> days = new ArrayList<Object>();
		map.put("startDay", sdf.format(calendar.getTime()));
		daysMap.put("startDay",  sdf.format(calendar.getTime()));
		days.add(sdf2.format(calendar.getTime()));
		for (int i = 1; i <= 6; i++) {
			calendar.add(Calendar.DATE, +i);
			
			days.add(sdf2.format(calendar.getTime()));
		
			if(i<6) {
			calendar.add(Calendar.DATE, -i);
			}
		}
		map.put("endDay", sdf.format(calendar.getTime())+" 23:59");
		daysMap.put("endDay",  sdf.format(calendar.getTime()));
		daysMap.put("days", days);
		map.put("e_number", session.getAttribute("e_number"));
		

		
	
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list =fdao.facilitySchedule(map);
		list.add(0,daysMap);
		
		return list;
		
		
	}
	
	
}
