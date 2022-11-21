package com.daiko.system.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.EmployeeService;
import com.daiko.system.service.workService;

@Controller
public class WorkController {

	@Inject
	private workService ws;
	@Inject
	private EmployeeService es;
	
	@RequestMapping(value = "work", method = RequestMethod.GET)
	public String work(@RequestParam int type ,Model model) {
		model.addAttribute("type", type);
		model.addAttribute("contentPage", "work.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "worklist",method = RequestMethod.GET)
	public List<Map<String, Object>> list(@RequestParam Map<String, Object>map, Model model, HttpSession session) {
		return ws.list(map, session);
	}
	@RequestMapping(value = "workForm",method = RequestMethod.GET)
	public String workForm(@RequestParam Map<String, Object> map,Model model,HttpSession session) {
		
	if (map.get("seq")==null) {
		model.addAttribute("title",map.get("title"));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("now", sdf.format(date));
		
		model.addAttribute("name", session.getAttribute("name"));
	}	
	else {
	    model.addAttribute("map", ws.detail(map));
	    
	    
	}
	model.addAttribute("employeeList", es.employeeList());
		
		return "popup/workForm";
	}
	
	@RequestMapping(value = "workInsert",method =RequestMethod.POST )
	public void workInsert(@RequestParam Map<String,Object>map,HttpSession session,HttpServletResponse response) throws IOException {
		
		ws.workInsert(map, session);
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 sb1.append("alert('申請しました。');");
		 sb1.append("opener.location.reload();");
		 sb1.append("window.close();");
		 sb1.append("</script>");

		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
	}
	
	@RequestMapping(value = "workUpdate",method =RequestMethod.POST )
	public void workUpdate(@RequestParam Map<String,Object>map,HttpServletResponse response) throws IOException {
		
		ws.workUpdate(map);
		
		
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 if (map.get("judgment").equals("承認")) {
			 sb1.append("alert('承認しました。');");
			
		}else {
			sb1.append("alert('拒否しました。');");
			
		}
		 sb1.append("opener.location.reload();");
		 sb1.append("window.close();");
		 sb1.append("</script>");

		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
	}
	
	
}
