package com.daiko.system.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daiko.system.service.FacilityService;

@Controller
public class FacilityController {
	
	@Inject
	private FacilityService fs;
	
	@RequestMapping(value = "facility", method = RequestMethod.GET)
	public String facility(@RequestParam int facilityNo, Model model){
		
		model.addAttribute("facilityNo", facilityNo);
		model.addAttribute("contentPage", "facility.jsp");
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "facilitySchedule")
	public List<Map<String, Object>> facilitySchedule(@RequestParam Map<String,Object>map,HttpSession session){
		
		return fs.facilitySchedule(map, session);
	}
	
	@RequestMapping(value = "facilityForm")
	public String facilityForm(@RequestParam Map<String, Object>map,Model model) {
		model.addAttribute("map", map);
		return "popup/facilityForm";
	}
	
	@RequestMapping(value = "facilityInsert",method = RequestMethod.POST)
	public void facilityInsert(@RequestParam Map<String, Object>map,HttpServletResponse response,HttpSession session) throws IOException {
		
		
		fs.facilityInsert(map, session);
		//popup close
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 sb1.append("alert('追加成功しました。');");
		 sb1.append("opener.location.reload();");
		 sb1.append("window.close();");
		 sb1.append("</script>");

		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
	}
	@RequestMapping(value = "facilityDetail")
	public String facilityDetail(@RequestParam int seq,Model model,HttpSession session) {
		Map<String, Object>map = fs.facilityDetail(seq);
		model.addAttribute("map", map);
		model.addAttribute("e_number",session.getAttribute("e_number"));
		return "popup/facilityForm";
		
	}
	@RequestMapping(value = "facilityDelete",method = RequestMethod.POST)
	public void facilityDelete(@RequestParam Map<String, Object>map,HttpServletResponse response) throws IOException {
		
		
		fs.facilityDelete(map);
			
		
		//popup close
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 sb1.append("alert('削除成功しました。');");
		 sb1.append("opener.location.reload();");
		 sb1.append("window.close();");
		 sb1.append("</script>");
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
	}
	@RequestMapping(value = "facilityUpdate",method = RequestMethod.POST)
	public void facilityUpdate(@RequestParam Map<String, Object>map,HttpServletResponse response) throws IOException {
		
		
		
			fs.facilityUpdate(map);
		
		//popup close
		 StringBuffer sb1 = new StringBuffer();
		 sb1.append("<script type='text/javascript'>");
		 sb1.append("alert('編集成功しました。');");
		 sb1.append("opener.location.reload();");
		 sb1.append("window.close();");
		 sb1.append("</script>");
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out1 = response.getWriter();
		 out1.println(sb1);
		 out1.flush();
	}
}
