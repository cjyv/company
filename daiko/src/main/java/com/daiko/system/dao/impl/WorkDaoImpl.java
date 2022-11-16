package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.WorkDAO;

@Repository
public class WorkDaoImpl implements WorkDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("list", map);
	}
}
