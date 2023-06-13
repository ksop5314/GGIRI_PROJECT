package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.admin.dto.GgiriAdminDTO;
import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriFreeInsertMapper;

import edu.emory.mathcs.backport.java.util.Arrays;
@Service
public class GgiriFreeInsertServiceImpl implements GgiriFreeInsertService{
	
	@Autowired
	private GgiriFreeInsertMapper gfm;
	
	@Autowired
	private GgiriFreeInsertService gfs;
	
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


	
//	GgiriFreeInsertDTO dto = gfm.getBoard(userid);
//	model.addAttribute("info", dto);
		
		
		
	
		
	
	
}
