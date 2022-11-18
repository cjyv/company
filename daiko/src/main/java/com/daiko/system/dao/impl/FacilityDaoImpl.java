package com.daiko.system.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daiko.system.dao.FacilityDAO;

@Repository
public class FacilityDaoImpl implements FacilityDAO{
	
	@Inject
	private SqlSession ss;
	
	@Override
	public List<Map<String, Object>> facilitySchedule(Map<String, Object> map) {
	
		return ss.selectList("facility.list", map);
	}
	
	@Override
	public int facilityInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.insert("facility.insert",map);
	}
	
	@Override
	public Map<String, Object> facilityDetail(int seq) {
		// TODO Auto-generated method stub
		return ss.selectOne("facility.Detail", seq);
	}
	
	@Override
	public int facilityDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.delete("facility.delete", map);
	}
	@Override
	public int facilityUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.update("facility.update", map);
	}
}
