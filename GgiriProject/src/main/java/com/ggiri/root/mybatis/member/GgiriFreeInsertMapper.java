package com.ggiri.root.mybatis.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriFreeInsertMapper {
	
	// 프리랜서 등록하기 
	public int writeSave(GgiriFreeInsertDTO dto);
	
	public List<GgiriFreeInsertDTO> selectJob(String job);
	
	
	public GgiriFreeInsertDTO getBoard(String userid);
	
	public List<GgiriMemberDTO> boardAllList();
		
	public int writeFreeModify(GgiriFreeInsertDTO dto);	
	
	public void writeFreeDelete(String userid);
	
	public List<CompleteDTO> getProject(String userid);
}
