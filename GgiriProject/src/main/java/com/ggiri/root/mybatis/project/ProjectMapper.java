package com.ggiri.root.mybatis.project;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ProjectMapper {

	public List<ProjectDTO> projectList();
	
	public ProjectDTO projectView(int projectNum);
	
	public void insertPro(ProjectDTO dto);
	
	public void proHit(int projectNum);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);

	public List<ProjectDTO> search(@Param("keyword") String keyword, @Param("condition") String condition);

	public int getProjectCountBySearch(@Param("keyword") String keyword, @Param("condition") String condition);

	public List<ProjectDTO> getProjectListBySearch(@Param("keyword") String keyword, @Param("condition") String condition,
	                                               @Param("startRow") int startRow, @Param("endRow") int endRow);

	public List<ProjectDTO> getProjectList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int getProjectCount();

    List<ProjectDTO> getProjectList(Map<String, Object> params);

    int getProjectCountBySearch(Map<String, Object> searchParams);

    List<ProjectDTO> getProjectListBySearch(Map<String, Object> searchParams);
    
    public List<ProjectDTO> searchByTitleAndContent(@Param("keyword") String keyword);

    public List<ProjectDTO> searchByTitle(@Param("keyword") String keyword);

    public List<ProjectDTO> searchByAuthor(@Param("keyword") String keyword);
    
    
    // 댓글
//    public void addReply(ProjectRepDTO dto);
    public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
	// 대댓글
	public int re_addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> re_getRepList(int bno);
    
    
    
    
    
}