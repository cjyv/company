package com.daiko.system.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.daiko.system.dto.EmployeeDTO;
import com.daiko.system.service.EmployeeService;
import com.daiko.system.service.ToDoService;
import com.daiko.system.service.workService;

@Controller
public class EmployeeController {

	@Inject
	private EmployeeService employeeservice;
	@Inject
	private ToDoService todoservice;
	@Inject
	private workService workservice;
	private final String uploadImagePath ="C:\\Users\\choij\\Desktop\\test(java)\\daiko\\src\\main\\webapp\\resources\\img/";

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute EmployeeDTO dto ,Model model, HttpSession session) {
		String name = employeeservice.loginCheck(dto, session);
		
		if(name == null || name.isEmpty()) {
			model.addAttribute("message", "error");
			return "login";
		}
		else {
			model.addAttribute("name",name);
			model.addAttribute("profilePhoto", session.getAttribute("profilePhoto"));
			model.addAttribute("todoCount",todoservice.progressTodo(session).get("count(seq)"));
			model.addAttribute("workCount", workservice.progress(session).get("count"));
			model.addAttribute("workCount2", workservice.workConfirm(session));
			model.addAttribute("contentPage", "home.jsp");
		return "index";
		}
	}
	
	@RequestMapping(value = "logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		employeeservice.logOut(session);
		return "login";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Model model,HttpSession session) {
		
		Map<String, Object> profile = employeeservice.profile(session);
		String tellphone = String.valueOf(profile.get("e_phone"));
		String tellphone1 = tellphone.substring(0,3);
		String tellphone2 = tellphone.substring(3,7);
		String tellphone3 = tellphone.substring(7,11);
		model.addAttribute("tellphone1",tellphone1);
		model.addAttribute("tellphone2",tellphone2);
		model.addAttribute("tellphone3",tellphone3);
		model.addAttribute("profile", profile);
		model.addAttribute("contentPage", "profile.jsp");
		return "index";
	}
	
	@RequestMapping(value = "profileUpdate.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8" )
	public String profileUpdate(@RequestParam Map<String, Object> map,MultipartFile file,Model model, HttpSession session) throws IllegalStateException, IOException {
		String tellphone1= String.valueOf(map.get("tellphone1"));
		String tellphone2= String.valueOf(map.get("tellphone2"));
		String tellphone3= String.valueOf(map.get("tellphone3"));
		String tellphone = tellphone1+tellphone2+tellphone3;
		map.put("e_phone", tellphone);
	
	
		UUID ui = UUID.randomUUID();
		
		String oldProfile= String.valueOf(map.get("oldProfile"));
		File oldFile = new File(uploadImagePath+oldProfile);
		String newFileName = ui+"_"+file.getOriginalFilename();
		File newFile = new File(uploadImagePath+newFileName);
		if(file.getSize()>0) {
			map.put("profile",newFileName);
			oldFile.delete();
			file.transferTo(newFile);
		}
	
		map.put("e_number", session.getAttribute("e_number"));
		if(employeeservice.profileUpdate(map)==1) {
			model.addAttribute("name",map.get("name"));
			session.setAttribute("name", map.get("name"));
			model.addAttribute("profilePhoto", map.get("profile"));
			session.setAttribute("profilePhoto", map.get("profile"));
		}
		
		
		/*
		dto.setE_phone(tellphone);
		if(password1!=null) {
		dto.setPassword(password1);
		}
		
			dto.setProfile(fileName);
			file.transferTo(newFile);	
		dto.setE_number(e_number);
		*/
		return profile(model, session);
	}
	
	
}
