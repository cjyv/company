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
		return ss.selectList("work.list", map);
	}
	@Override
	public Map<String, Object> progressWork(int e_number) {
		// TODO Auto-generated method stub
		return ss.selectOne("work.progress", e_number);
	}
	
	@Override
	public int workInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.insert("work.insert", map);
	}
	
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectOne("work.detail", map);
	}
	
	@Override
	public int workUpdate(Map<String, Object> map) {

		return ss.update("work.update", map);
	}
	@Override
	public int workCofirm(int e_number) {
		// TODO Auto-generated method stub
		return ss.selectOne("work.confirm", e_number);
	}
}
