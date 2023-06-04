package com.ggiri.root.mybatis.project;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

import com.ggiri.root.project.dto.ProjectDTO;

public interface ProjectMapper {

	public List<ProjectDTO> projectList();
	
	public ProjectDTO projectView(int projectNum);
	
	public void insertPro(ProjectDTO dto);
	
	public void proHit(int projectNum);
	
	public void modify(ProjectDTO dto);
	
	public void delete(int projectNum);

	public List<ProjectDTO> search(@Param("keyword") String keyword, @Param("searchType") String searchType);

	public int getProjectCountBySearch(@Param("keyword") String keyword, @Param("searchType") String searchType);

	public List<ProjectDTO> getProjectListBySearch(@Param("keyword") String keyword, @Param("searchType") String searchType,
	                                               @Param("startRow") int startRow, @Param("endRow") int endRow);

	public List<ProjectDTO> getProjectList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int getProjectCount();

    List<ProjectDTO> getProjectList(Map<String, Object> params);

    int getProjectCountBySearch(Map<String, Object> searchParams);

    List<ProjectDTO> getProjectListBySearch(Map<String, Object> searchParams);
}