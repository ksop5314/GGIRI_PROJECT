package com.ggiri.root.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.member.service.MailSendService;

@Controller
@RequestMapping("ggiriMember")
public class GgiriController {
	
	@Autowired
	private GgiriService gs;
	
	@Autowired
	private MailSendService mss;
	
	@GetMapping("ggiriLogin")
	public String login() {
		return "ggiriMember/ggiriLogin";
	}
	
	@GetMapping("signup_free")
	public String signupFree() {
		return "ggiriMember/signup_free";
	}
	
	@RequestMapping("register")
	public String register(GgiriMemberDTO member) {
		int result = gs.register(member);
		if(result == 1)
			return "redirect:ggiriLogin";
		return "redirect:signup_free";
	}
	
	@PostMapping("IdCheck")
	@ResponseBody
	public int nameCheck(@RequestParam("id") String id) {
		return gs.idCheck(id);
	}
	
	@GetMapping("mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String userEmail) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + userEmail);
		return mss.joinEmail(userEmail);
	}
	
	
}
