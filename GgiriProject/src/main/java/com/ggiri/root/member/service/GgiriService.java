package com.ggiri.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriService {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public int loginCheck(HttpServletRequest request);
	
	// 안태준
	public void boardAllList(Model model);
	
	public void Info(String userid, Model model);
	// 안태준 끝
}
