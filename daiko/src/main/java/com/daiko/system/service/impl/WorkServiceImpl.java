package com.daiko.system.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.WorkDAO;
import com.daiko.system.service.workService;

@Service
public class WorkServiceImpl implements workService {
	
	@Inject
	private WorkDAO wdao;
	

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map, HttpSession session) {
		map.put("e_number", session.getAttribute("e_number"));
	
		return wdao.list(map);
	}
	
	@Override
	public Map<String, Object> progress(HttpSession session) {
		int e_number = (Integer) session.getAttribute("e_number");
		return wdao.progressWork(e_number);
	}
	
	@Override
	public int workInsert(Map<String, Object> map, HttpSession session) {
		map.put("a_e_number", session.getAttribute("e_number"));
		return wdao.workInsert(map);
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return wdao.detail(map);
	}
	
	@Override
	public int workUpdate(Map<String, Object> map) {
		
		return wdao.workUpdate(map);
	}
	
	@Override
	public int workConfirm(HttpSession session) {
		int e_number = (Integer) session.getAttribute("e_number");
		return wdao.workCofirm(e_number);
	}
}
