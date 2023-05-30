package com.ggiri.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriMemberMapper;

@Service
public class GgiriServiceImpl implements GgiriService{

	@Autowired
	private GgiriMemberMapper gmm;
	
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
}
