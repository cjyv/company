package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface workService {

	
	public List<Map<String, Object>> list(Map<String, Object>map,HttpSession session);
	
	public Map<String, Object> progress(HttpSession session);
	
	public int workInsert(Map<String, Object>map,HttpSession session);
	
	public Map<String, Object> detail(Map<String, Object>map);
	
	public int workUpdate(Map<String, Object>map);
	
	public int workConfirm(HttpSession session);
}
