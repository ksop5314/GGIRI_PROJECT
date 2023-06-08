package com.ggiri.root.mybatis.project;

import com.ggiri.root.project.VO.LikeVO;

public interface LikeMapper {
    void insertLike(LikeVO like);
    void deleteLike(LikeVO like);
    int getLikeCount(int projectNum);
	void likeProject(LikeVO like);
	void unlikeProject(LikeVO like);
	void insertLike(int projectNum, String user_no);
	void deleteLike(int projectNum, String user_no);
}