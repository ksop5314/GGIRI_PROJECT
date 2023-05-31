package com.ggiri.root.member.service;

import javax.servlet.http.HttpServletRequest;

import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriService {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public int loginCheck(HttpServletRequest request);
	
}
