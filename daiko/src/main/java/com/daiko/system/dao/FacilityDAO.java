package com.daiko.system.dao;

import java.util.List;
import java.util.Map;

public interface FacilityDAO {

	
	public List<Map<String, Object>> facilitySchedule(Map<String, Object>map);
	
	public int facilityInsert(Map<String, Object>map);
	
	public Map<String, Object> facilityDetail(int seq);
	
	public int facilityDelete(Map<String, Object>map);
	
	public int facilityUpdate(Map<String, Object>map);
}
