
package com.ggiri.root.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.ProjectDTO;

public interface ProjectService {

	public void projectList(Model model);
	
	public void projectView(int projectNum, Model model);
	
	public void insertPro(ProjectDTO dto);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);
	
}
