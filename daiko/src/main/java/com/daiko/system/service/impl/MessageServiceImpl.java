package com.daiko.system.service.impl;

import java.util.HashMap;
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
	
	@Override
	public int messageInsert(Map<String, Object> map, HttpSession session) {
		map.put("a_e_number", session.getAttribute("e_number"));
		return mdao.messageInsert(map);
	}
	
	@Override
	public int unreadMessage(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("e_number", session.getAttribute("e_number"));
		return mdao.unreadMessage(map);
	}
	
	@Override
	public int readMessage(Map<String, Object> map, HttpSession session) {
		map.put("e_number", session.getAttribute("e_number"));
		int b_e_number = Integer.parseInt(String.valueOf(map.get("b_e_number")));
		map.put("b_e_number",b_e_number );
		return mdao.readMessage(map);
	}
}
