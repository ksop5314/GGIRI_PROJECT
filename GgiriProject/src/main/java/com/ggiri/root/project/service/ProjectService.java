
package com.ggiri.root.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.dto.ReprepDTO;

public interface ProjectService {

	public void projectList(Model model);
	
	public void projectView(int projectNum, Model model);
	
	public void insertPro(ProjectDTO dto);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);
	
	public List<ProjectDTO> search(String keyword, String condition);
    
    public int getProjectCountBySearch(String keyword, String condition);
    
    public List<ProjectDTO> getProjectListBySearch(String keyword, String condition, int startRow, int endRow);
    
    public List<ProjectDTO> getProjectList(int page, int perPage);

    public int getProjectCount();
    
    
	
	
}
