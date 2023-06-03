package com.ggiri.root.kakao.service;

public class SystemUtil {
	
	public static boolean EmptyCheck(String kakaoToken) {
		if(kakaoToken != null) {
			return false;
		}
		return true;
	}
}
