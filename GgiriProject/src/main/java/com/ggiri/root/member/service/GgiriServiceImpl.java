package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriMemberMapper;

@Service
public class GgiriServiceImpl implements GgiriService{

	@Autowired
	private GgiriMemberMapper gmm;
	
	@Autowired
	private GgiriFreeInsertService gfi;
	
	// 강준호
	@Override
	public int register(GgiriMemberDTO member) {
		try {
			
			return gmm.register(member);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int idCheck(String id) {
		return gmm.idCheck(id);
	}
	
	@Override
	public int loginCheck(HttpServletRequest request) {
		GgiriMemberDTO dto = gmm.loginCheck(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 0;
			}
		}
		return 1;
	}
	
	@Override
	public GgiriMemberDTO findEmail(String email) {
		return gmm.findEmail(email);
	}
	
	@Override
	public int findNaver(String naverMember) {
		int findNaver = gmm.findNaver(naverMember);
		if(findNaver == 0) {
			return 0;
		}
		return 1;
	}
	
	@Override
	public void naverInsert(GgiriMemberDTO naverInsert) {
		gmm.naverInsert(naverInsert);
	}
	
	@Override
	public int findKakao(String kakaoMember) {
		int findKakao = gmm.findKakao(kakaoMember);
		if(findKakao == 0) {
			return 0;
		}
		return 1;
	}
	
	
	@Override
	public void kakaoinsert(GgiriMemberDTO kakaoInsert) {
		gmm.kakaoinsert(kakaoInsert);
		
	}
	
	// 강준호 끝
	
	
	// 안테준
	@Override
	public void boardAllList(Model model) {
		model.addAttribute("boardList", gmm.boardAllList());
	}
	
	@Override
	public List<GgiriMemberDTO> selectJob(String job) {
		List<GgiriMemberDTO> list = gmm.selectJob(job);
		return list;
	}
	

	@Override
	public void Info(String userid, Model model) {
		// TODO Auto-generated method stub
		GgiriMemberDTO dto = gmm.getBoard(userid);
		model.addAttribute("info", dto);
	}
	// 안태준 끝
	
	@Override
	public int joinPhone(String userTel) {
		return gmm.joinPhone(userTel);
	}
	
}
