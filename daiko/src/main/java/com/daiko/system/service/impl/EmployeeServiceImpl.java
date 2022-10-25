package com.daiko.system.service.impl;

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
		String name = employedao.loginCheck(dto);
		if(name != null) {
			session.setAttribute("e_id", dto.getE_id());
			session.setAttribute("name", name);
		}
		
		return name;
	}
	@Override
	public void logOut(HttpSession session) {
		session.invalidate();
	}
}
