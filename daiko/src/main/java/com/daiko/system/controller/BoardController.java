package com.daiko.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "noticeDetail",method = RequestMethod.GET)
	public String noticeDetail(@RequestParam int noticeNumber ,Model model) {
		Map<String, Object> detail = noticeService.detail(noticeNumber);

		
		model.addAttribute("contentPage", "noticeDetail.jsp");
		model.addAttribute("detail", detail);
		
		return "index";
	}
	@RequestMapping(value = "noticeInsert",method = RequestMethod.GET)
	public String noticeInsert(Model model) {
		
		model.addAttribute("contentPage", "noticeInsert.jsp");
		
		return "index";
		
	}
	
}
