package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriService {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public int loginCheck(HttpServletRequest request);
	public int joinPhone(String userTel);
	public GgiriMemberDTO findEmail(String email);
	public int findNaver(String naverMember);
	public void naverInsert(GgiriMemberDTO naverInsert);
	public int findKakao(String kakaoMember);
	public void kakaoinsert(GgiriMemberDTO kakaoInsert);
	
	// 안태준
	public void boardAllList(Model model);
	
	
	
	
	
	// 안태준 끝
}
