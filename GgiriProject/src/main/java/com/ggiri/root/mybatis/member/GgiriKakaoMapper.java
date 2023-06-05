package com.ggiri.root.mybatis.member;


import com.ggiri.root.kakao.vo.SessionConfigVO;

public interface GgiriKakaoMapper {

	public int findKakao(SessionConfigVO findUser);
	public void kakaoinsert(SessionConfigVO insertUser);
}
