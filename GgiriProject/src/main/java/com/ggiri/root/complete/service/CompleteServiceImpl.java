
package com.ggiri.root.complete.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.mybatis.complete.CompleteMapper;

@Service
public class CompleteServiceImpl implements CompleteService {

	@Autowired
	private CompleteMapper cm;
	
	@Override
	public void completeList(Model model) {
		model.addAttribute("completeList", cm.completeList());
	}
	
	
	@Override
	public void comView(int completeNum, Model model) {
		model.addAttribute("data", cm.comView(completeNum));
		cm.comHit(completeNum);
	}
	
	@Override
	public int insertCom(CompleteDTO dto) {
		return cm.insertCom(dto);
	}
	
	@Override
	public int modify(CompleteDTO dto) {
		return cm.modify(dto);
	}
	
	@Override
	public void delete(int completeNum) {
		cm.delete(completeNum);
	}
	
	@Override
	public void adminCompleteList(Model model) {
		model.addAttribute( "",cm.adminCompleteList());
	}
	
	
}
