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
		map.put("name", session.getAttribute("name"));
		return wdao.list(map);
	}
}
