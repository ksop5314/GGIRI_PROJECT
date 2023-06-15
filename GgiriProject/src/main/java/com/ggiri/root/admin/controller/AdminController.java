package com.ggiri.root.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.complete.service.CompleteService;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.project.service.ProjectService;

@Controller
@RequestMapping("ggiriAdmin")
public class AdminController {
	
	@Autowired
	private GgiriService gs;
	@Autowired
	private GgiriFreeInsertService gfs;
	@Autowired
	private ProjectService ps;
	@Autowired
	private CompleteService cs;
	
	
	@GetMapping("adminList")
	public String adminList(Model model) {
		gfs.boardAllList(model);
		return "ggiriAdmin/adminList";
	}
	
	@GetMapping("adminLogout")
	public String logout(HttpSession session) {
		if(session.getAttribute("ADMIN") != null) {
			session.invalidate();
		}
		return "ggiriAdmin/adminLogout";
	}
	
	@GetMapping("allMember")
	public String allMember(Model model, HttpSession session) {
		String id = (String)session.getAttribute("ADMIN");
		System.out.println(id);
		gs.allMember(model, id);
		return "ggiriAdmin/allMember";
	}
	
	@GetMapping("freeDelete")
	@ResponseBody
	public String freeDelete(@RequestParam("deleteId") String deleteId) {
		gfs.freeDelete(deleteId);
		return "OK";
	}
	
	@GetMapping("memberDelete")
	@ResponseBody
	public String memberDelete(@RequestParam("deleteId") String deleteId) {
		gs.deleteId(deleteId);
		return "OK";
	}
	
	@GetMapping("proDelete")
	@ResponseBody
	public String proDelete(@RequestParam("projectNum") int projectNum) {
		//int proNum = Integer.parseInt(projectNum);
		ps.proDelete(projectNum);
		return "OK";
	}
	
	@GetMapping("adminProjectList")
	public String adminProjectList(Model model) {
		ps.adminProjectList(model);
		return "ggiriAdmin/adminProjectList";
	}
	
	@GetMapping("adminCompleteList")
	public String adminCompleteList(Model model) {
		cs.adminCompleteList(model);
		return "ggiriAdmin/adminCompleteList";
	}
	
	@GetMapping("adminReplyList")
	public String adminReplyList() {
		
		return "ggiriAdmin/adminReplyList";
	}
	
	@GetMapping("adminHelpList")
	public String adminHelpList() {
		
		return "ggiriAdmin/adminHelpList";
	}
	
	
}
