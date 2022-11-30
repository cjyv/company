package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MessageService {

	
	public List<Map<String, Object>> messageList(Map<String, Object>map,HttpSession session);
	
	public int messageInsert(Map<String, Object>map,HttpSession session);
	
	public int unreadMessage(HttpSession session);
	
	public int readMessage(Map<String, Object>map,HttpSession session);
}
