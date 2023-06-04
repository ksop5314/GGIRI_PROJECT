package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriFreeInsertMapper;
@Service
public class GgiriFreeInsertServiceImpl implements GgiriFreeInsertService{
	
	@Autowired
	private GgiriFreeInsertMapper gfm;
	
	@Autowired
	private GgiriMessageService gm;

	@Override
	public String writeSave(HttpServletRequest request) {
		
		GgiriFreeInsertDTO dto = new GgiriFreeInsertDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setIntroduce(request.getParameter("introduce"));
		dto.setJob(request.getParameter("job"));
		dto.setSkill(request.getParameter("skill"));
		dto.setProject_period(Integer.parseInt(request.getParameter("project_period")));
		dto.setPlace_of_work(request.getParameter("place_of_work"));
		dto.setInsertdate(request.getParameter("insertdate"));
		
		int result = 0;
		try {
			result = gfm.writeSave(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글이 등록 되었습니다";
			url = "/ggiriMember/writeFree";
		}else {
			msg = "글등록 실패";
			url = "/ggiriMember/writeFree";
		}
		
		return gm.getMessage(request, msg, url);

	}
	
	@Override
	public void Info(String userid, Model model) {
		// TODO Auto-generated method stub
		GgiriFreeInsertDTO dto = gfm.getBoard(userid);
		model.addAttribute("info", dto);
	}
	
	@Override
	public List<GgiriFreeInsertDTO> selectJob(String job) {
		List<GgiriFreeInsertDTO> list = gfm.selectJob(job);
		return list;
	}
	
	
	
}
