package com.ggiri.root.mybatis.project;

import java.util.List;

import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ReplyMapper {

	// 댓글
	public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
	
	
}
