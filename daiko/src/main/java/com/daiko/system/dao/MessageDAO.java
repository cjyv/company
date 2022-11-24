package com.daiko.system.dao;

import java.util.List;
import java.util.Map;

public interface MessageDAO {

	public List<Map<String, Object>> messageList(Map<String, Object>map);
	
	public int messageInsert(Map<String, Object>map);
}
