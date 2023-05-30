package com.ggiri.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ggiriMember")
public class GgiriController {

	
	@GetMapping("signup_free")
	public String signupFree() {
		return "ggiriMember/signup_free";
	}
	
	
}
