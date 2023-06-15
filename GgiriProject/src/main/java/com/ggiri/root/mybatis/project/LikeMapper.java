package com.ggiri.root.mybatis.project;

public interface LikeMapper {
    void insertLike(int projectNum, String user_no);
    void deleteLike(int projectNum, String user_no);
    void saveHeart(String projectNum, String userid);
    boolean isLiked(String projectNum, String userid);
    void removeHeart(String projectNum, String userid);
    int getLikeCount(String projectNum);
}
