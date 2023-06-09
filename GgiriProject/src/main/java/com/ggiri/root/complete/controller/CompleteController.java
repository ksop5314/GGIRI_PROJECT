
package com.ggiri.root.complete.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.complete.service.CompleteService;

@Controller
@RequestMapping("ggiriComplete")
public class CompleteController {

	@Autowired
	private CompleteService cs;
	
	@GetMapping("completeList")
	public String completeList(Model model) {
		cs.completeList(model);
		return "ggiriComplete/completeList";
	}
	
	@RequestMapping("completeWrite")
	public String comWrite() {
		return "ggiriComplete/completeWrite";
	}
	
	@GetMapping("completeView")
	public String comView(@RequestParam("completeNum") int completeNum, Model model) {
		cs.comView(completeNum, model);
		return "ggiriComplete/completeView";
	}
	
	
	@PostMapping("comSave")
	public String comSave(CompleteDTO dto) {
		System.out.println("date : " + dto.getComdate());
		cs.insertCom(dto);
		return "redirect:completeList";
	}
	
	@GetMapping("completeModify")
	public String modify(@RequestParam("completeNum") int completeNum, Model model) {
		cs.comView(completeNum, model);
		return "ggiriComplete/completeModify";
	}
	
	@PostMapping("modify")
	public String modify(CompleteDTO dto) {
		int su = cs.modify(dto);
		if(su == 1) {
			return "redirect:completeList";
		} 
		return "ggiriComplete/comFail";
		
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("completeNum") int completeNum) {
		cs.delete(completeNum);
		return "redirect:completeList";
	}
	
	
}
