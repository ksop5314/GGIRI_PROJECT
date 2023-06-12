package com.ggiri.root.admin.service;

import java.util.List;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.ProjectDTO;

public interface AdminService {
	
	public void adminAllList(Model model);
	
	public List<ProjectDTO> search(String keyword, String condition);
    
    public int getProjectCountBySearch(String keyword, String condition);
    
    public List<ProjectDTO> getProjectListBySearch(String keyword, String condition, int startRow, int endRow);
    
    public List<ProjectDTO> getProjectList(int page, int perPage);
}
