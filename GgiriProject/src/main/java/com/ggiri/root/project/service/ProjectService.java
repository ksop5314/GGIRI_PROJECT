package com.ggiri.root.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ProjectService {

	public List<Map<String, Object>> projectList(Model model);

    public void projectView(int projectNum, Model model);
	
	public int insertPro(ProjectDTO dto);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);
	
	public List<ProjectDTO> search(String keyword, String condition);
    
    public int getProjectCountBySearch(String keyword, String condition);
    
    public List<ProjectDTO> getProjectListBySearch(String keyword, String condition, int startRow, int endRow);
    
    public List<ProjectDTO> getProjectList(int page, int perPage);

    public int getProjectCount();
    
    public List<ProjectDTO> getProjectInfo(int projectNum, Model model);
    
    
    // 관리자 페이지
    public void adminProjectList(Model model);
    
    public void proDelete(int projectNum);

    
    public void adminReplyList(Model model);
    
    // 댓글
    public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
	public void repDelete(int no);
	
	// 프로젝트 리스트 
    public List<Map<String, Object>> selectJob(Model model);
    
    public List<Map<String, Object>> selectSnsJob(String id,Model model);


    // 좋아요 
//    public void like_check(int projectNum, int memberNum);
//    
//    public int select_heart(GgiriBoardLikeDTO dto);






}
