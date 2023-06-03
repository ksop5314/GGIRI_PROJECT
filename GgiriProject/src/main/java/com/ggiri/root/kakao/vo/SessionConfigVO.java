package com.ggiri.root.kakao.vo;

import java.sql.Date;

public class SessionConfigVO {

	private String kakaoNickname;
	private String kakaoEmail;
	private String kakaoBirth;
	private String kakaoGender;
	private Date logdate;
	
	public String getKakaoNickname() {
		return kakaoNickname;
	}
	public void setKakaoNickname(String kakaoNickname) {
		this.kakaoNickname = kakaoNickname;
	}
	public String getKakaoEmail() {
		return kakaoEmail;
	}
	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}
	public String getKakaoBirth() {
		return kakaoBirth;
	}
	public void setKakaoBirth(String kakaoBirth) {
		this.kakaoBirth = kakaoBirth;
	}
	public String getKakaoGender() {
		return kakaoGender;
	}
	public void setKakaoGender(String kakaoGender) {
		this.kakaoGender = kakaoGender;
	}
	public Date getLogdate() {
		return logdate;
	}
	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}
	
	
	
	
}
