package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ToDoService {

	
	public List<Map<String, Object>> todoList(HttpSession session);
}
