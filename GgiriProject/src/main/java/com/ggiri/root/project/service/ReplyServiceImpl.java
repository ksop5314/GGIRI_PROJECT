
package com.ggiri.root.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggiri.root.mybatis.project.ReplyMapper;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.dto.ReprepDTO;

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
    
	@Override
	public void re_modify(ProjectRepDTO dto) {
		rm.re_modify(dto);
	}
	
	@Override
	public void delete(int memberNum) {
		rm.delete(memberNum);
	}
	
	
	// 대댓글
//	@Override
//	public int re_addReplyTest(ReprepDTO dto) {
//		return rm.re_addReplyTest(dto);
//	}
//    
//	@Override
//	public List<ReprepDTO> re_getRepList(int bno) {
//		return rm.re_getRepList(bno);
//	}
	
}
