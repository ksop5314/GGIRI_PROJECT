
package com.ggiri.root.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
//	@GetMapping("projectWrite")
//	public String proWrite() {
//		return "ggiriProject/projectWrite";
//	}
	
	@GetMapping("projectView")
	public String projectView(@RequestParam("projectNum") int projectNum, Model model) {
		ps.projectView(projectNum, model);
		return "ggiriProject/projectView";
	}
	
}
