package com.ggiri.root.member.service;

import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriService {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	
}
