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
}
