
package com.ggiri.root.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.service.ProjectService;

@Controller
@RequestMapping("ggiriProject")
public class ProjectController {
	
	@Autowired
	private ProjectService ps;
	

    @RequestMapping("projectWrite")
    public String proWrite() {
        return "ggiriProject/projectWrite";
    }

    @GetMapping("projectView")
    public String projectView(@RequestParam("projectNum") int projectNum, Model model) {
        ps.projectView(projectNum, model);
        return "ggiriProject/projectView";
    }

    @PostMapping("projectSave")
    public String projectSave(ProjectDTO dto) {
        ps.insertPro(dto);
        return "redirect:/ggiriProject/projectList";
    }

    @GetMapping("modifyForm")
    public String modifyForm(@RequestParam("projectNum") int projectNum, Model model) {
        ps.projectView(projectNum, model);
        return "ggiriProject/modifyForm";
    }

    @PostMapping("modify")
    public String modify(ProjectDTO dto) {
        ps.modify(dto);
        return "redirect:/ggiriProject/projectList";
    }

    @GetMapping("delete")
    public String delete(@RequestParam("projectNum") int projectNum) {
        ps.delete(projectNum);
        return "redirect:/ggiriProject/projectList";
    }
    
    @GetMapping("projectList")
    public String projectList(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "searchType", defaultValue = "title") String searchType,
        Model model
    ) {
        int perPage = 10; // 한 페이지에 보여줄 프로젝트 개수
        
        if (keyword != null && !keyword.isEmpty()) {
            // 검색어가 입력된 경우 검색 기능 적용
            int totalCount = ps.getProjectCountBySearch(keyword, searchType);
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            int startRow = (page - 1) * perPage + 1;
            int endRow = startRow + perPage - 1;
            List<ProjectDTO> projectList = ps.getProjectListBySearch(keyword, searchType, startRow, endRow);
            
            model.addAttribute("keyword", keyword);
            model.addAttribute("searchType", searchType);
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        } else {
            // 검색어가 없는 경우 전체 프로젝트 목록 조회
            List<ProjectDTO> projectList = ps.getProjectList(page, perPage);
            int totalCount = ps.getProjectCount();
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        }

        return "ggiriProject/projectList";
    }
}