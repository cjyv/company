package com.daiko.system.dao.impl;

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
public String loginCheck(EmployeeDTO dto) {
	return ss.selectOne("employee.loginCheck",dto);
}

	
}
