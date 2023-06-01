package com.ggiri.root.mybatis.member;

import javax.servlet.http.HttpServletRequest;

import com.ggiri.root.member.dto.GgiriFreeInsertDTO;

public interface GgiriFreeInsertMapper {
	
	// 프리랜서 등록하기 
	public int writeSave(GgiriFreeInsertDTO dto);
	
	
}
