package com.ggiri.root.admin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.mybatis.admin.GgiriAdminMapper;
import com.ggiri.root.project.dto.ProjectDTO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	GgiriAdminMapper gam;
	
	@Override
	public void adminAllList(Model model) {
		model.addAttribute("ggiriList", gam.adminAllList());
	}
	
	@Override
	public List<ProjectDTO> search(String keyword, String searchType) {
	    return gam.search(keyword, searchType);
	}

	@Override
    public int getProjectCountBySearch(String keyword, String searchType) {
        return gam.getProjectCountBySearch(keyword, searchType);
    }

    @Override
    public List<ProjectDTO> getProjectListBySearch(String keyword, String searchType, int startRow, int endRow) {
        return gam.getProjectListBySearch(keyword, searchType, startRow, endRow);
    }

    @Override
    public List<ProjectDTO> getProjectList(int page, int perPage) {
        int startRow = (page - 1) * perPage + 1;
        int endRow = startRow + perPage - 1;
        return gam.getProjectList(startRow, endRow);
    }
	
}
