package com.ggiri.root.kakao.vo;

public class SessionConfigVO {

	private String userName;
	private String userId;
	private boolean kakao_login;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public boolean isKakao_login() {
		return kakao_login;
	}
	public void setKakao_login(boolean kakao_login) {
		this.kakao_login = kakao_login;
	}
	
}
