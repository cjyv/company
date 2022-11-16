package com.daiko.system.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class NoticeController {

	@Inject
 	private NoticeService noticeService;
	private final String uploadPath ="C:\\Users\\choij\\Desktop\\test(java)\\daiko\\src\\main\\webapp\\resources\\file/";
	
	//お知らせ一覧
	@RequestMapping(value = "notice",method = RequestMethod.GET )
	public String notice(HttpSession session,Model model) {
		List noticeList = new ArrayList();
		
		noticeList = noticeService.NoticeList();
		
		model.addAttribute("contentPage", "notice.jsp");
		model.addAttribute("noticeList", noticeList);
		
		return "index";
	}
	//お知らせ項目ディテール
	@RequestMapping(value = "noticeDetail",method = RequestMethod.GET)
	public String noticeDetail(@RequestParam int noticeNumber ,Model model,HttpSession session) {
		Map<String, Object> detail = noticeService.detail(noticeNumber);

		
		model.addAttribute("contentPage", "noticeDetail.jsp");
		model.addAttribute("detail", detail);
		model.addAttribute("e_number", session.getAttribute("e_number"));
		
		return "index";
	}
	//お知らせ追加移動
	@RequestMapping(value = "noticeInsert",method = RequestMethod.GET)
	public String noticeInsert(@RequestParam int seq, Model model) {
	Map<String, Object> detail = noticeService.detail(seq);

		
		
		
		
		model.addAttribute("detail", detail);
		model.addAttribute("contentPage", "noticeWrite.jsp");
		
		return "index";
		
	}
	//お知らせ追加機能
	@RequestMapping(value = "noticeInsert.do",method = RequestMethod.POST)
	public String noticeInsert_Do(@RequestParam Map<String, Object> map, MultipartFile file, Model model,HttpSession session ) throws IllegalStateException, IOException {
		
		UUID ui = UUID.randomUUID();
		
	if(file.getSize()>0) {	
		String realFileName = file.getOriginalFilename();
		String File = ui+"_"+realFileName;
		File saveFile = new File(uploadPath+File);
		
		file.transferTo(saveFile);

		
		map.put("file",File);
		map.put("realFileName",realFileName);
		
	}
		map.put("name", session.getAttribute("name"));
		map.put("e_number", session.getAttribute("e_number"));
		
		
		
		noticeService.insert(map);
		
		return notice(session, model);
	}
	
	@RequestMapping("fileDown")
	public void fileDown(@RequestParam String file, @RequestParam String realFileName, HttpServletResponse response,
		HttpServletRequest request) {
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		File dfile = new File(uploadPath+file);
		
		try {
			fis = new FileInputStream(dfile);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String reFilename = "";

			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				reFilename = URLEncoder.encode(realFileName, "utf-8");
				reFilename = realFileName.replaceAll("\\+", "%20");
			} else {
				reFilename = new String(realFileName.getBytes("utf-8"), "ISO-8859-1");
			}

			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + reFilename + "\"");
			response.setContentLength((int) file.length());
			int read = 0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam Map<String,Object> map,Model model,HttpSession session) {
		if(map.get("oldFile")!=null) {
			String oldFile = String.valueOf(map.get("oldFile"));
			File file= new File(uploadPath+oldFile);
			file.delete();
		}
		
		noticeService.delete(map);
		
		return notice(session, model);
		
	}
	@RequestMapping(value = "noticeUpdate.do",method = RequestMethod.POST)
	public String noticeUpdate_Do(@RequestParam Map<String, Object> map, MultipartFile file, Model model,HttpSession session ) throws IllegalStateException, IOException {
		
		
		if(map.get("oldFile")!=null) {
			String oldFile = String.valueOf(map.get("oldFile"));
			File file2= new File(uploadPath+oldFile);
			file2.delete();
		}
		
		
		UUID ui = UUID.randomUUID();
		
	if(file.getSize()>0) {	
		String realFileName = file.getOriginalFilename();
		String File = ui+"_"+realFileName;
		File saveFile = new File(uploadPath+File);
		
		file.transferTo(saveFile);

		
		map.put("file",File);
		map.put("realFileName",realFileName);
		
	}
	
		
		
		
		noticeService.update(map);
		
		
		return notice(session, model);
	}
	
	
		
	}
	

