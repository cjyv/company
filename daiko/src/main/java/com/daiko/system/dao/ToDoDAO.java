package com.daiko.system.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ToDoDAO {

	
	public List<Map<String, Object>> todoList(Map<String, Object>map);
	
	public Map<String, Object> todoDetail(int seq);
}
