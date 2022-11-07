package com.daiko.system.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.ToDoDAO;

@Repository
public class ToDoDAOImpl implements ToDoDAO {
	
	@Inject
	private SqlSession ss;
	@Override
	public List<Map<String, Object>> todoList(Map<String, Object>map) {
		
		return ss.selectList("todo.list",map);
	}
	
	@Override
	public Map<String, Object> todoDetail(int seq) {
		// TODO Auto-generated method stub
		return ss.selectOne("todo.detail", seq);
	}
}
