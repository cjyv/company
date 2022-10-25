package com.daiko.system.service;

import javax.servlet.http.HttpSession;

import com.daiko.system.dto.EmployeeDTO;

public interface EmployeeService {

public String loginCheck(EmployeeDTO dto, HttpSession session);
public void logOut(HttpSession session);
	
	
}
