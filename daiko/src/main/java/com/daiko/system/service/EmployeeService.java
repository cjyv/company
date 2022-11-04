package com.daiko.system.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.daiko.system.dto.EmployeeDTO;

public interface EmployeeService {

public String loginCheck(EmployeeDTO dto, HttpSession session);
public void logOut(HttpSession session);
public Map<String, Object> profile(HttpSession session);
public int profileUpdate(Map<String, Object>map);	
}
