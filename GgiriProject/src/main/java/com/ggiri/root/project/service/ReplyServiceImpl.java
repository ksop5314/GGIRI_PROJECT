
package com.ggiri.root.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggiri.root.mybatis.project.ReplyMapper;
import com.ggiri.root.project.dto.ProjectRepDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper rm;
	
	// 댓글
	@Override
    public int addReplyTest(ProjectRepDTO dto) {
    	
    	return rm.addReplyTest(dto);
    }
    
	@Override
	public List<ProjectRepDTO> getRepList(int bno) {
		return rm.getRepList(bno);
	}
    
	
}
