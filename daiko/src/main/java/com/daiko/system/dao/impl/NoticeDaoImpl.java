package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.NoticeDAO;

@Repository
public class NoticeDaoImpl implements NoticeDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public List<Map<String, Object>> noticeList() {
	return ss.selectList("notice.noticeList");
	
	}
}
