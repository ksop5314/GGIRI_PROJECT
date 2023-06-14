
package com.ggiri.root.project.service;

import java.util.List;


import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ReplyService {

	// 댓글
	public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
	
}
