package com.daiko.system.dao;


import java.util.Map;

import com.daiko.system.dto.EmployeeDTO;;


public interface EmployeeDAO {

	
	public Map<String, Object> loginCheck(EmployeeDTO dto);
	
	public Map<String, Object> profile(EmployeeDTO dto);
}
