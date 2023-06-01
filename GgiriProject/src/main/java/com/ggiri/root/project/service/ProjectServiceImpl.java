
package com.ggiri.root.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		pm.proHit(projectNum);
	}
	
	@Override
	public void insertPro(ProjectDTO dto) {
		pm.insertPro(dto);
	}
	
	@Override
	public void modify(ProjectDTO dto) {
		pm.modify(dto);
	}
	
	@Override
	public void delete(int projectNum) {
		pm.delete(projectNum);
	}
	
}
