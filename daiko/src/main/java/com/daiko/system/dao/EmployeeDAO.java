package com.daiko.system.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.daiko.system.dto.EmployeeDTO;;


public interface EmployeeDAO {

	
	public Map<String, Object> loginCheck(EmployeeDTO dto);
	
	public Map<String, Object> profile(int e_number);
	
	public int profileUpdate(Map<String, Object> map);
	
	public List<Map<String, Object>> employeeList();
}
