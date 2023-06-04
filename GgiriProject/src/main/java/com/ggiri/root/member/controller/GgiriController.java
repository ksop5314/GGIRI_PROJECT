package com.ggiri.root.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.ggiri.root.kakao.service.KakaoService;
import com.ggiri.root.kakao.service.SystemUtil;
import com.ggiri.root.kakao.vo.SessionConfigVO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.member.service.MailSendService;
import com.ggiri.root.mybatis.member.GgiriFreeInsertMapper;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriMember")
public class GgiriController implements GgiriMemberSession {
	
	@Autowired
	private GgiriService gs;
	
	@Autowired
	private KakaoService kakaoService;
	
	// 안태준
	@Autowired
	private GgiriFreeInsertService gfs;
	@Autowired
	private GgiriFreeInsertMapper gfi;
	
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
	
//	@RequestMapping("kakaoLogin")
//	public String kakaoLogin() {
//		StringBuffer loginUrl = new StringBuffer();
//		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
//		loginUrl.append("0bc794d215c15ba457b2eb709fecd070");
//		loginUrl.append("&redirect_uri=");
//		loginUrl.append("http://localhost:8080/root/ggiriMember/kakao_callback");
//		loginUrl.append("&response_type=code");
//		System.out.println(loginUrl.toString());
//		
//		return "redirect:"+loginUrl.toString();
//	}
	
	@RequestMapping("kakao_callback")
	public String redirectkakao(@RequestParam("code") String code, HttpSession session) throws IOException{
		System.out.println(code);
		
		String kakaoToken = kakaoService.getReturnAccessToken(code);
		System.out.println("controller access_token : " + kakaoToken);
		
		Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
		System.out.println("컨트롤러 출력 : " + result.get("account_email"));
		SessionConfigVO configVO = new SessionConfigVO();
		
		configVO.setKakaoEmail((String)result.get("email"));
		configVO.setKakaoNickname((String)result.get("nickname"));
		
		session.setAttribute("sessionConfigVO", configVO);
		session.setAttribute("kakaoToken", kakaoToken);
		
		return "redirect:/index";
	}
	
	@RequestMapping("kakaoLogout")
	public String kakaoLogout(HttpSession session) throws Exception {
		if(SystemUtil.EmptyCheck((String)session.getAttribute("kakaoToken"))) {
		} else {
			kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
		}
		
		session.setAttribute("sessionConfigVO", null);
		
		return "ggiriMember/kakaoLogout";
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
//	@GetMapping(value="developer/{job}", produces="application/json; charset=utf-8")
	@GetMapping("selectJob")
	@ResponseBody
	public List<GgiriMemberDTO> selectJob(@RequestParam("job") String job) {
//	public List<GgiriFreeInsertDTO> developer(@PathVariable String job, Model model){	

		return gs.selectJob(job);
	}
	
	@GetMapping("writeFree")
	public String writeFree() {
		return "ggiriMember/writeFree";
	}
	@PostMapping("writeSave")
	public void writeSave(HttpServletResponse response,
							HttpServletRequest request) throws IOException{
		String message = gfs.writeSave(request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
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
