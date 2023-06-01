
package com.ggiri.root.mybatis.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.ProjectDTO;

public interface ProjectMapper {

	public List<ProjectDTO> projectList();
	
	public ProjectDTO projectView(int projectNum);
	
	public void insertPro(ProjectDTO dto);
	
	public void proHit(int projectNum);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);
	
}
