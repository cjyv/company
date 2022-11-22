package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.MessageDAO;

@Repository
public class MessageDaoImpl implements MessageDAO {

	@Inject
	private SqlSession ss;
	@Override
	public List<Map<String, Object>> messageList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("message.list", map);
	}
}
