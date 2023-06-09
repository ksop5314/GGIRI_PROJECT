package com.ggiri.root.project.service;

import javax.servlet.http.HttpSession;

import com.ggiri.root.project.dto.LikeDTO;

public interface LikeService {
	
    LikeDTO saveHeart(String no, HttpSession session);
    LikeDTO removeHeart(String projectNum, HttpSession session);
    
}