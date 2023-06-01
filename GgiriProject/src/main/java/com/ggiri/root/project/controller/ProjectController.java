
package com.ggiri.root.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@GetMapping("projectList")
	public String projectList(Model model) {
		ps.projectList(model);
		return "ggiriProject/projectList";
	}
	
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
		return "redirect:projectList";
	}
	
	@GetMapping("modifyForm")
	public String modifyForm(@RequestParam("projectNum") int projectNum, Model model) {
		ps.projectView(projectNum, model);
		return "ggiriProject/modifyForm";
	}
	
	@PostMapping("modify")
	public String modify(ProjectDTO dto) {
		ps.modify(dto);
		return "redirect:projectList";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("projectNum") int projectNum) {
		ps.delete(projectNum);
		return "redirect:projectList";
	}
	
}
