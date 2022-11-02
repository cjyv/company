package com.daiko.system.service.impl;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daiko.system.dao.EmployeeDAO;
import com.daiko.system.dto.EmployeeDTO;
import com.daiko.system.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Inject
	private EmployeeDAO employedao;
	
	
	@Override
	public String loginCheck(EmployeeDTO dto, HttpSession session) {
		Map<String, Object> map = employedao.loginCheck(dto);
		if((String)map.get("name") != null) {
			session.setAttribute("e_id", dto.getE_id());
			session.setAttribute("name", (String)map.get("name"));
			session.setAttribute("e_number",map.get("e_number"));
		}
		
		return (String)map.get("name");
	}
	@Override
	public void logOut(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public Map<String, Object> profile(EmployeeDTO dto, HttpSession session) {
		int number = Integer.parseInt((String.valueOf(session.getAttribute("e_number"))));
		dto.setE_number(number);
		Map<String, Object> map = employedao.profile(dto);
		return map;
	}
	
	
}
