package com.daiko.system.dao.impl;

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
public Map<String, Object> profile(EmployeeDTO dto) {
	return ss.selectOne("employee.profile", dto);
}
	
}
