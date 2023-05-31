package com.ggiri.root.mybatis.member;

import com.ggiri.root.member.dto.GgiriMemberDTO;

import java.util.List;
public interface GgiriMemberMapper {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public GgiriMemberDTO loginCheck(String id);
	public int joinPhone(String userTel);
	public GgiriMemberDTO findEmail(String email);
	
	
	// 안태준
	public List<GgiriMemberDTO> boardAllList();
	
	public GgiriMemberDTO getBoard(String userid);
	// 안태준 끝
}
