package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.CalendarDAO;

@Repository
public class CalendarDaoImpl implements CalendarDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public List<Map<String, Object>> calendarMemoList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("calendar.memoList", map);
	}
	
	@Override
	public List<Map<String, Object>> calendarTodoList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("calendar.todoList", map);
	}
	
	@Override
	public List<Map<String, Object>> calendarFacilityList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("calendar.facilityList", map);
	}
	
	@Override
	public int memoInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.insert("calendar.memoInsert", map);
	}
}
