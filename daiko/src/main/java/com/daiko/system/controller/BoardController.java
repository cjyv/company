package com.daiko.system.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.daiko.system.service.NoticeService;

@Controller
public class BoardController {

	@Inject
 	private NoticeService noticeService;
	private final String uploadPath ="C:\\Users\\choij\\Desktop\\test(java)\\daiko\\src\\main\\webapp\\resources\\file/";
	
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
		
		model.addAttribute("contentPage", "noticeWrite.jsp");
		
		return "index";
		
	}
	@RequestMapping(value = "noticeInsert.do",method = RequestMethod.POST)
	public String noticeInsert_Do(@RequestParam Map<String, Object> map, MultipartFile file, Model model,HttpSession session ) throws IllegalStateException, IOException {
		
		UUID ui = UUID.randomUUID();
		
		String realFileName = file.getOriginalFilename();
		String File = ui+"_"+realFileName;
		File saveFile = new File(uploadPath+File);
		
		file.transferTo(saveFile);

		String dSaveFile = uploadPath+File;
		map.put("file",dSaveFile);
		map.put("realFileName",realFileName);
		map.put("name", session.getAttribute("name"));
		map.put("e_number", session.getAttribute("e_number"));
		
		
		
		noticeService.insert(map);
		
		return notice(session, model);
	}
	
}
