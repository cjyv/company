package com.daiko.system.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	public List<Map<String, Object>> calendarMemoList(Map<String, Object>map);
	
	public List<Map<String, Object>> calendarFacilityList(Map<String, Object>map);
	
	public List<Map<String, Object>> calendarTodoList(Map<String, Object>map);
	
}
