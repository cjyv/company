package com.daiko.system.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.NoticeDAO;
import com.daiko.system.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	private NoticeDAO ndao;
	
	@Override
	public List<Map<String, Object>> NoticeList() {
		
		return ndao.noticeList();
	
	}
	
	@Override
	public Map<String, Object> detail(int noticeNumber) {
		// TODO Auto-generated method stub
		return ndao.noticeDetail(noticeNumber);
	}
	
	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ndao.noticeInsert(map);
	}
	
	@Override
	public int delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ndao.noticeDelete(map);
	}
	
	@Override
	public int update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ndao.noticeUpdate(map);
	}
	
	@Override
	public Map<String, Object> recently() {
		// TODO Auto-generated method stub
		return ndao.recently();
	}
}
