package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ToDoService {

	
	public List<Map<String, Object>> todoList(Map<String, Object>map, HttpSession session);
	
	public Map<String, Object> todoDetail(int seq);  
	
	public int todoInsert(Map<String, Object> map, HttpSession session);
	
	public int todoDelete(List<Integer>list);
	
	public void todoFileDelete(List<Integer>list);
	
	public int todoUpdate(Map<String, Object> map, HttpSession session);
	
	public Map<String, Object> progressTodo(HttpSession session);
	
	public Map<String, Object> yearWork(HttpSession session);
 }
