package com.daiko.system.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.daiko.system.service.ToDoService;





@Controller
public class ToDoController {
	
	@Inject
	private ToDoService todoservice;
	private final String uploadPath ="C:\\Users\\choij\\Desktop\\test(java)\\daiko\\src\\main\\webapp\\resources\\file/";

	
	@RequestMapping(value = "todo")
	public String ToDo(Model model, HttpSession session) {
	
		model.addAttribute("contentPage", "todo.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "todoList")
	public List<Map<String, Object>> ToDoList(HttpSession session){
		
		
		return todoservice.todoList(session);
	}
	@RequestMapping(value ="todoForm" )
	public String todoForm(@RequestParam int seq,Model model) {
		
		if(seq!=0) {
			Map<String, Object> todoDetailMap = todoservice.todoDetail(seq);
			model.addAttribute("detail", todoDetailMap);
		}
		
		
		return "popup/todoForm";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "todoInsert", method = RequestMethod.POST)
	public void todoInsert(@RequestParam Map<String,Object>map,MultipartFile referenceFile,HttpSession session,HttpServletResponse response) throws IllegalStateException, IOException {
	
		UUID ui = UUID.randomUUID();
		String fileName = ui+"_"+referenceFile.getOriginalFilename();
		File file = new File(uploadPath+fileName);
		
	if (referenceFile.getSize()>0) {
		
		referenceFile.transferTo(file);
		map.put("referenceFile", fileName);
		map.put("realFileName", referenceFile.getOriginalFilename());
	}
		todoservice.todoInsert(map, session);
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 sb1.append("alert('追加成功しました。');");
		 sb1.append("window.close();");
		 sb1.append("</script>");

		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
		
	}
	@RequestMapping(value = "todoDelete", method = RequestMethod.POST)
	public String todoDelete(Integer[] check, Model model,HttpSession session) {
		List<Integer> list = Arrays.asList(check);
		
		todoservice.todoFileDelete(list);
		todoservice.todoDelete(list);
		
		
	
		return ToDo(model, session);
	}

	
}
