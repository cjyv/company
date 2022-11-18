package com.daiko.system.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ToDoDAO {

	
	public List<Map<String, Object>> todoList(Map<String, Object>map);
	
	public Map<String, Object> todoDetail(int seq);
	
	public int todoInsert(Map<String, Object> map);
	
	public int todoDelete(List<Integer> list);
	
	public List<String> todoFileDelete(List<Integer> list);
	
	public int todoUpdate(Map<String, Object>map);
	
	public Map<String, Object> progressTodo(int e_number);
}
