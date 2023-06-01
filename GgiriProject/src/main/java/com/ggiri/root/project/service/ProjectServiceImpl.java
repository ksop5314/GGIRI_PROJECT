
package com.ggiri.root.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ggiri.root.mybatis.project.ProjectMapper;
import com.ggiri.root.project.dto.ProjectDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectMapper pm;
	
	@Override
	public void projectList(Model model) {
		model.addAttribute("projectList", pm.projectList());
	}
	
	@Override
	public void projectView(int projectNum, Model model) {
		model.addAttribute("data", pm.projectView(projectNum));
		//pm.updateHit(projectNum);
	}
	
	@Override
	public void insertPro(ProjectDTO dto) {
		pm.insertPro(dto);
	}
	
	
}
