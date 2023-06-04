package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriFreeInsertDTO;


public interface GgiriFreeInsertService {
	
	// 프리랜서 등록하기
	public String writeSave(HttpServletRequest request);
	
	public List<GgiriFreeInsertDTO> selectJob(String job);
	
	public void Info(String userid, Model model);
}
