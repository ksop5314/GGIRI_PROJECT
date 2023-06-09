package com.ggiri.root.picture;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

public class PictureController {

	@ResponseBody
	@RequestMapping(value = "/saveHeart.do")
	public PictureTO save_heart(@RequestParam String no, HttpSession session) {

	    PictureHeartTO to = new PictureHeartTO();

	    // 게시물 번호 세팅
	    to.setBno(no);

	    // 좋아요 누른 사람 nick을 userid로 세팅
	    to.setUserid((String) session.getAttribute("nick"));

	    // +1된 하트 갯수를 담아오기위함
	    PictureTO pto = heartDao.pictureSaveHeart(to);

	    return pto;
	}

	// 꽉찬하트 클릭시 하트 해제
	@ResponseBody
	@RequestMapping(value = "/removeHeart.do")
	public PictureTO remove_heart(@RequestParam String projectNum, HttpSession session) {
	    PictureHeartTO to = new PictureHeartTO();

	    // 게시물 번호 세팅
	    to.setBno(projectNum);

	    // 좋아요 누른 사람 nick을 userid로 세팅
	    to.setUserid((String) session.getAttribute("nick"));

	    // -1된 하트 갯수를 담아오기위함
	    PictureTO pto = heartDao.pictureRemoveHeart(to);

	    return pto;
	}

	
}
