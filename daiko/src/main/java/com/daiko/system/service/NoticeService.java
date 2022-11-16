package com.daiko.system.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	public List<Map<String, Object>> NoticeList();
	
	public Map<String, Object> detail(int noticeNumber); 
	
	public int insert(Map<String, Object> map);
	
	public int delete(Map<String, Object>map);
	
	public int update(Map<String, Object>map);
	
}
