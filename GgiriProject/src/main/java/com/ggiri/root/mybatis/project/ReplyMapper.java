package com.ggiri.root.mybatis.project;

import java.util.List;

import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.dto.ReprepDTO;

public interface ReplyMapper {

	// 댓글
	public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
	public void re_modify(ProjectRepDTO dto);
	public void delete(int memberNum);
	
	
	// 대댓글
//	public int re_addReplyTest(ReprepDTO dto);
//	public List<ReprepDTO> re_getRepList(int bno);
	
	
	
	
}
