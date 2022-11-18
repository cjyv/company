package com.daiko.system.dao;

import java.util.List;
import java.util.Map;

public interface WorkDAO {

	
public List<Map<String, Object>> list(Map<String, Object>map); 

public Map<String, Object> progressWork(int e_number);
}
