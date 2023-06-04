package com.ggiri.root.kakao.service;

import java.util.Map;

import com.ggiri.root.kakao.vo.SessionConfigVO;

public interface KakaoService {
	
	public String getReturnAccessToken(String code);
	public Map<String, Object> getUserInfo(String access_token);
	public void getLogout(String access_token);
	public int findKakao(SessionConfigVO vo);
	public void kakaoinsert(SessionConfigVO vo);
	
}
