package com.ggiri.root.help.service;


import org.springframework.ui.Model;

import com.ggiri.root.help.dto.GgiriHelpDTO;
public interface GgiriHelpService {
	
	public int helpWrite(GgiriHelpDTO dto);
	
	public void HelpList(Model model);
	
	public void helpView(int helpNo, Model model);
	
	public void modify(GgiriHelpDTO dto);
	
	public void helpDelete(int helpNo);
	
	// 관리자 페이지
	public void adminHelpList(Model model);
}
