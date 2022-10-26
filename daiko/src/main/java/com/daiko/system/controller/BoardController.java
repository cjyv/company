package com.daiko.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daiko.system.service.NoticeService;

@Controller
public class BoardController {

	@Inject
 	private NoticeService noticeService;
	
	@RequestMapping(value = "notice",method = RequestMethod.GET )
	public String notice(HttpSession session,Model model) {
		List noticeList = new ArrayList();
		
		noticeList = noticeService.NoticeList();
		
		model.addAttribute("contentPage", "notice.jsp");
		
		model.addAttribute("noticeList", noticeList);
		
		return "index";
	}
	
	
}
