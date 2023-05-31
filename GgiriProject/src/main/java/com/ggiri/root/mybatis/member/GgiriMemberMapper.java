package com.ggiri.root.mybatis.member;

import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriMemberMapper {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public GgiriMemberDTO loginCheck(String id);
	public int joinPhone(String userTel);
	public GgiriMemberDTO findEmail(String email);
	
}
