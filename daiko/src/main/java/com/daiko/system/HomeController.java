package com.daiko.system;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daiko.system.service.MessageService;
import com.daiko.system.service.NoticeService;
import com.daiko.system.service.ToDoService;
import com.daiko.system.service.workService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
@Inject
private ToDoService todoservice;
@Inject
private workService workservice;
@Inject
private MessageService messageservice;
@Inject
private NoticeService noticeservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,  Model model) {
		
		
	if(session.getAttribute("name")==null) {
		return "login";
	}
	else {
		model.addAttribute("todoCount",todoservice.progressTodo(session).get("count(seq)"));
		model.addAttribute("workCount", workservice.progress(session).get("count"));
		model.addAttribute("workCount2", workservice.workConfirm(session));
		model.addAttribute("messageCount", messageservice.unreadMessage(session));
		model.addAttribute("yearWork", todoservice.yearWork(session));
		model.addAttribute("recentlyNews", noticeservice.recently());
		model.addAttribute("contentPage", "home.jsp");
		return "index";
	}
	}
	
}
