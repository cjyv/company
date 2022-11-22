package com.daiko.system.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.daiko.system.dao.MessageDAO;
import com.daiko.system.service.MessageService;

@Service
public class MessageServiceImpl  implements MessageService{

	@Inject
	private MessageDAO mdao;
	
	@Override
	public List<Map<String, Object>> messageList(Map<String, Object> map, HttpSession session) {
		map.put("e_number", session.getAttribute("e_number"));
		
		return mdao.messageList(map);
	}
}
