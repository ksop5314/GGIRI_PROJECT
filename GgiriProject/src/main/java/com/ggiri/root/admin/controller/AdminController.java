package com.ggiri.root.admin.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ggiri.root.complete.service.CompleteService;
import com.ggiri.root.help.dto.GgiriAdminHelpDTO;
import com.ggiri.root.help.service.GgiriHelpService;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.project.service.ProjectService;

import oracle.jdbc.proxy.annotation.Post;

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
	@Autowired
	private GgiriHelpService ghs;
	
	@GetMapping("allMember")
	public String allMember(Model model, HttpSession session) {
		gs.allMember(model);
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
	
	 @GetMapping("adminList")
	    public String projectList(Model model) {
	        int perPage = 10;

	        gfs.boardAllList(model);
	        
			return "ggiriAdmin/adminList";
	    }
	 
	@GetMapping("repDelete")
	@ResponseBody
	public String repDelete(@RequestParam("no") int no) {
		ps.repDelete(no);
		return "OK";
	}
	 
	@GetMapping("proDelete")
	@ResponseBody
	public String proDelete(@RequestParam("projectNum") int projectNum) {
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
	
	@GetMapping("comDelete")
	@ResponseBody
	public String comDelete(@RequestParam("deleteCompleteNum") int completeNum) {
		cs.comDelete(completeNum);
		return "OK";
	}
	
	@GetMapping("adminReplyList")
	public String adminReplyList(Model model) {
		ps.adminReplyList(model);
		return "ggiriAdmin/adminReplyList";
	}
	
	@GetMapping("adminHelpList")
	public String adminHelpList(Model model) {
		ghs.adminHelpList(model);
		return "/ggiriAdmin/adminHelpList";
	}

	@PostMapping("adminHelpReply")
	@ResponseBody
	public int adminHelpReply(@RequestBody Map<String, Object> map) {
		
		GgiriAdminHelpDTO dto = new GgiriAdminHelpDTO();
		
		String helpMember = (String)map.get("helpMember");
		String helpNo = (String)map.get("helpNo");
		String adminRep = (String)map.get("adminRep");
		String adminid = (String)map.get("adminid");
		
		dto.setHelpNo(Integer.parseInt(helpNo));
		dto.setHelpMember(helpMember);
		dto.setAdminRep(adminRep);
		dto.setAdminid(adminid);
		
		int su = ghs.adminHelpReply(dto);
		return su;
	}
	
	@GetMapping("adminRepData")
	@ResponseBody
	public List<GgiriAdminHelpDTO> adminRepData(@RequestParam("helpNo") int helpNo) {
		System.out.println(helpNo);
		return ghs.adminRepData(helpNo);
	}
	
	@GetMapping("deleteAdminRep")
	@ResponseBody
	public String deleteAdminRep(@RequestParam("adminRepNo") int adminRepNo) {
		ghs.deleteAdminRep(adminRepNo);
		return "OK";
	}
	
	@PostMapping("modifyAdminRep")
	@ResponseBody
	public String modifyAdminRep(@RequestBody GgiriAdminHelpDTO dto) {
		ghs.modifyAdminRep(dto);
		return "OK";
	}
	
}
