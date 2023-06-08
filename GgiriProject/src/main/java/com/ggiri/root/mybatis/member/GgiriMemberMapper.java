package com.ggiri.root.mybatis.member;

import com.ggiri.root.member.dto.GgiriMemberDTO;

import java.util.List;
public interface GgiriMemberMapper {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public GgiriMemberDTO loginCheck(String id);
	public int joinPhone(String userTel);
	public GgiriMemberDTO findEmail(String email);
	public int findNaver(String naverMember);
	public void naverInsert(GgiriMemberDTO naverInsert);
	public int findKakao(String kakaoMember);
	public void kakaoinsert(GgiriMemberDTO kakaoInsert);
	public int findGoogle(String googleMember);
	public void googleinsert(GgiriMemberDTO googleInsert);
	public int modifyResult(GgiriMemberDTO modifyMember);
	public GgiriMemberDTO ggiriMemberInfo(String id);
	public GgiriMemberDTO ggiriSnsInfo(String id);
	
	
}
