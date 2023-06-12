package com.ggiri.root.admin.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.project.dto.ProjectDTO;

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

	@GetMapping("projectList")
    public String projectList(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "condition", defaultValue = "title") String condition,
        Model model
    ) {
        int perPage = 10; // 한 페이지에 보여줄 프로젝트 개수

        if (keyword != null && !keyword.isEmpty()) {
            // 검색어가 입력된 경우 검색 기능 적용
            int totalCount = gs.getProjectCountBySearch(keyword, condition);
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            int startRow = (page - 1) * perPage + 1;
            int endRow = startRow + perPage - 1;
            List<ProjectDTO> projectList = gs.getProjectListBySearch(keyword, condition, startRow, endRow);
            
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        } else {
            // 검색어가 없는 경우 전체 프로젝트 목록 조회
            List<ProjectDTO> projectList = gs.getProjectList(page, perPage);
            int totalCount = gs.getProjectCount();
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        }

        return "ggiriAdmin/projectList";
	}
}
