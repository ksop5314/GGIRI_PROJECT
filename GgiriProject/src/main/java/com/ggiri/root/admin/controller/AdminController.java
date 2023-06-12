package com.ggiri.root.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;

@Controller
@RequestMapping("ggiriAdmin")
public class AdminController {
	
	@Autowired
	private GgiriService gs;
	@Autowired
	private GgiriFreeInsertService gfs;
	
	
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
}
