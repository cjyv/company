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
	
	@Override
	public Map<String, Object> noticeDetail(int noticeNumber) {
		
		return ss.selectOne("notice.Detail", noticeNumber);
	}
	
	@Override
	public int noticeInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.insert("notice.Insert", map);
	}
	
	@Override
	public int noticeDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.delete("notice.Delete", map);
	}
	
	@Override
	public int noticeUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.update("notice.Update",map);
	}
	
	@Override
	public Map<String, Object> recently() {
		// TODO Auto-generated method stub
		return ss.selectOne("notice.recently");
	}
}
