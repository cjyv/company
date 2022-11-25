package com.daiko.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.CalendarDAO;
import com.daiko.system.dao.FacilityDAO;
import com.daiko.system.service.CalendarService;
@Service
public class CalendarServiceImpl implements CalendarService{

    @Inject
    private CalendarDAO cdao;
    @Inject

	
	@Override
	public List<Map<String, Object>> calendarMemoList(Map<String, Object> map) {
		
		return cdao.calendarMemoList(map);
	}
	
	@Override
	public List<Map<String, Object>> calendarFacilityList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cdao.calendarFacilityList(map);
	}
	
	@Override
	public List<Map<String, Object>> calendarTodoList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cdao.calendarTodoList(map);
	}
}
