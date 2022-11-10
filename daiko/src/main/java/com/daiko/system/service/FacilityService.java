package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface FacilityService {

	
	public List<Map<String, Object>> facilitySchedule(Map<String, Object>map,HttpSession session);
}
