package com.ggiri.root.mybatis.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.project.dto.ProjectDTO;

public interface GgiriAdminMapper {

	public List<GgiriMemberDTO> adminAllList();
	
	List<ProjectDTO> search(@Param("keyword") String keyword, @Param("condition") String condition);

	int getProjectCountBySearch(@Param("keyword") String keyword, @Param("condition") String condition);

	List<ProjectDTO> getProjectListBySearch(@Param("keyword") String keyword, @Param("condition") String condition);
//	                                        @Param("startRow") int startRow, @Param("endRow") int endRow);

//	List<ProjectDTO> getProjectList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	
}
