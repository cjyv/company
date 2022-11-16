package com.daiko.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface workService {

	
	public List<Map<String, Object>> list(Map<String, Object>map,HttpSession session);
}
