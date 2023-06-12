package com.ggiri.root.admin.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.mybatis.admin.GgiriAdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	GgiriAdminMapper gam;
	
	@Override
	public void adminAllList(Model model) {
		model.addAttribute("ggiriList", gam.adminAllList());
	}
	
}
