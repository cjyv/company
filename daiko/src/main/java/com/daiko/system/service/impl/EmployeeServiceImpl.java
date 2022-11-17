package com.daiko.system.service.impl;

import java.util.List;
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
		try {
			String name = (String)map.get("name");
		
				session.setAttribute("e_id", dto.getE_id());
				session.setAttribute("name", name);
				session.setAttribute("e_number",map.get("e_number"));
				session.setAttribute("profilePhoto",map.get("profile"));
			
			
			return name;
			
		} catch (Exception e) {
			String name = null;
			return null;
		}
		
	
	}
	@Override
	public void logOut(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public Map<String, Object> profile(HttpSession session) {
		int e_number = Integer.parseInt((String.valueOf(session.getAttribute("e_number"))));
		Map<String, Object> map = employedao.profile(e_number);
		return map;
	}
	@Override
	public int profileUpdate(Map<String, Object>map) {
		return employedao.profileUpdate(map);
	}
	
	@Override
	public List<Map<String, Object>> employeeList() {
		
		return employedao.employeeList();
	}
	
	
}
