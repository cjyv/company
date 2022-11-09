package com.daiko.system.service.impl;

import java.io.File;
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
	private final String uploadImagePath ="C:\\Users\\choij\\Desktop\\test(java)\\daiko\\src\\main\\webapp\\resources\\img/";
	@Override
	public List<Map<String, Object>> todoList(Map<String, Object> map,HttpSession session) {
		

		
		
		map.put("e_number", session.getAttribute("e_number"));
		List<Map<String, Object>> todoList = tdo.todoList(map);
		
		
		return todoList;
	}
	
	@Override
	public Map<String, Object> todoDetail(int seq) {
		
		return tdo.todoDetail(seq);
	}
	
	@Override
	public int todoInsert(Map<String, Object> map, HttpSession session) {
		
		map.put("e_number", session.getAttribute("e_number"));
		return tdo.todoInsert(map);
	}
	
	@Override
	public int todoDelete(List<Integer> list) {
		
		return tdo.todoDelete(list);
	}
	
	@Override
	public void todoFileDelete(List<Integer> list) {
		
		List<String> deleteList = tdo.todoFileDelete(list);
		if(deleteList!=null) {
		for (String deletefile : deleteList) {
			if (deletefile!=null) {
				File file = new File(uploadImagePath+deletefile);
				file.delete();
			}
		}
		
		}
	}
	
}
