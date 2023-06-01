
package com.ggiri.root.project.service;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.ProjectDTO;

public interface ProjectService {

	public void projectList(Model model);
	
	public void projectView(int projectNum, Model model);
	
	public void insertPro(ProjectDTO dto);
	
}
