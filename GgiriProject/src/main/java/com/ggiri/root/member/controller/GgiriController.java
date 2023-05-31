package com.ggiri.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.member.service.MailSendService;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriMember")
public class GgiriController implements GgiriMemberSession {
	
	@Autowired
	private GgiriService gs;
	
	@Autowired
	private MailSendService mss;
	
	@GetMapping("ggiriLogin")
	public String login() {
		return "ggiriMember/ggiriLogin";
	}
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "ggiriMember/findIdPwd";
	}
	
	@GetMapping("signup_free")
	public String signupFree() {
		return "ggiriMember/signup_free";
	}
	
	
	@PostMapping("login_check")
	public String loginCheck(HttpServletRequest request, RedirectAttributes ra) {
		int result = gs.loginCheck(request);
		if(result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:failLogin";
	}
	
	@RequestMapping("failLogin")
	public String failLogin() {
		return "ggiriMember/failLogin";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "ggiriMember/successLogin";
	}
	
	@GetMapping("ggiriLogout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "ggiriMember/ggiriLogout";
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
	
	@GetMapping("telCheck")
	@ResponseBody
	public int userTelChk(@RequestParam("tel") String userTel) {
		return gs.joinPhone(userTel);
	}
	
	@GetMapping("mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String userEmail) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + userEmail);
		return mss.joinEmail(userEmail);
	}
	

	// 안태준 
	@GetMapping("memberList")
	public String AllList(Model model) {
		gs.boardAllList(model);
		return "ggiriMember/memberList";
	}
	@GetMapping("Info")
	public String MemberList(@RequestParam("id") String userid, Model model) {
		gs.Info(userid ,model);
		return "ggiriMember/Info";
	}
	@GetMapping("writeFree")
	public String writeFree() {
		return "ggiriMember/writeFree";
	}
	// 안태준 끝

	@PostMapping("findEmail")
	public String findEmail(@RequestParam("findEmail") String email) {
		GgiriMemberDTO dto = gs.findEmail(email);
		if(dto != null) {
			return mss.findEmail(dto);
		}
		return "ggiriMember/failEmail";
	}

	
}
