package com.ggiri.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface GgiriFreeInsertService {
	
	// 프리랜서 등록하기
	public String writeSave(HttpServletRequest request);
	
	public void developer(String job, Model model);
}
