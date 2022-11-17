package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.EmployeeDAO;
import com.daiko.system.dto.EmployeeDTO;;

@Repository
public class EmployeeDaoImpl implements EmployeeDAO {

	@Inject
	private SqlSession ss;
	
@Override
public Map<String, Object> loginCheck(EmployeeDTO dto) {
	return ss.selectOne("employee.loginCheck",dto);
}
@Override
public Map<String, Object> profile(int e_number) {
	return ss.selectOne("employee.profile", e_number);
}

@Override
public int profileUpdate(Map<String, Object> map) {
	return ss.update("employee.profileUpdate", map);
}

@Override
public List<Map<String, Object>> employeeList() {

	return ss.selectList("employee.employeelist");
}
	
}
