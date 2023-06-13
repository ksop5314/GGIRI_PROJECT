
package com.ggiri.root.complete.service;

import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;

public interface CompleteService {

	public void completeList(Model model);
	
	public void comView(int completeNum, Model model);
	
	public void insertCom(CompleteDTO dto);
	
	public void modify(CompleteDTO dto);
	
	public void delete(int completeNum);
	
	public void adminCompleteList(Model model);
	
}
