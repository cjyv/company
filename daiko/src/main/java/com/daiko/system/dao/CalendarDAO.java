package com.daiko.system.dao;

import java.util.List;
import java.util.Map;

public interface CalendarDAO {

	public List<Map<String, Object>>calendarMemoList(Map<String, Object>map);
	
	public List<Map<String, Object>>calendarTodoList(Map<String, Object>map);
	
	public List<Map<String, Object>>calendarFacilityList(Map<String, Object>map);
	
	public int memoInsert(Map<String, Object> map);
}
