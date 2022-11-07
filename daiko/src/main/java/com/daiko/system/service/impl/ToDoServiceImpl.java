package com.daiko.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.ToDoDAO;
import com.daiko.system.service.ToDoService;

@Service
public class ToDoServiceImpl implements ToDoService {
	
	@Inject
	private ToDoDAO tdo;
	
	@Override
	public List<Map<String, Object>> todoList(HttpSession session) {
		
	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("e_number", session.getAttribute("e_number"));
		
		List<Map<String, Object>> todoList = tdo.todoList(map);
	
		
		return todoList;
	}
}
