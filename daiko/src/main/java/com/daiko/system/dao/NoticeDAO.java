package com.daiko.system.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {

	
	public List<Map<String, Object>> noticeList();
	
	public Map<String,Object> noticeDetail(int noticeNumber);
	
	public int noticeInsert(Map<String, Object> map);
	
	public int noticeDelete(Map<String, Object>map);
	
	public int noticeUpdate(Map<String, Object>map);
	
	public Map<String, Object> recently();
}
