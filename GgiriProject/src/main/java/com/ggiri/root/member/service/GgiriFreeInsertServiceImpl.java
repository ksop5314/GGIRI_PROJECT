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
	public int writeSave(GgiriFreeInsertDTO dto) {
		
		try {
			return gfm.writeSave(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		

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
