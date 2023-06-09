package com.ggiri.root.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggiri.root.mybatis.project.LikeMapper;
import com.ggiri.root.mybatis.project.ProjectMapper;
import com.ggiri.root.project.dto.LikeDTO;
import com.ggiri.root.project.dto.PictureDTO;

@Service
public class LikeServiceImpl implements LikeService {

    private final LikeMapper likeMapper;
    private final ProjectMapper projectMapper;

    @Autowired
    public LikeServiceImpl(LikeMapper likeMapper, ProjectMapper projectMapper) {
        this.likeMapper = likeMapper;
        this.projectMapper = projectMapper;
    }
    
    @Override
    public LikeDTO saveHeart(String projectNum, HttpSession session) {
        String userid = (String) session.getAttribute("likeId");

        // 이미 좋아요를 눌렀는지 확인
        boolean isLiked = likeMapper.isLiked(projectNum, userid);
        if (isLiked) {
            // 이미 좋아요를 눌렀을 경우, 예외 처리 또는 다른 동작 수행
            // 예시: 이미 좋아요를 눌렀다는 메시지를 반환하거나 예외를 던지기
            throw new IllegalStateException("이미 좋아요를 눌렀습니다.");
        }

        // 좋아요 저장
        likeMapper.saveHeart(projectNum, userid);

        // +1된 하트 개수를 담아오기
        int heartCount = likeMapper.getLikeCount(projectNum);

        LikeDTO likeDTO = projectMapper.getPicture(projectNum);
        LikeDTO.setHeart(heartCount);

        return LikeDTO;
    }

    @Override
    public PictureDTO removeHeart(String projectNum, HttpSession session) {
        String userid = (String) session.getAttribute("likeId");

        // 좋아요를 이미 눌렀는지 확인
        boolean isLiked = likeMapper.isLiked(projectNum, userid);
        if (!isLiked) {
            // 좋아요를 누르지 않은 경우, 예외 처리 또는 다른 동작 수행
            // 예시: 좋아요를 누르지 않았다는 메시지를 반환하거나 예외를 던지기
            throw new IllegalStateException("좋아요를 누르지 않았습니다.");
        }

        // 좋아요 제거
        likeMapper.removeHeart(projectNum, userid);

        // -1된 하트 개수를 담아오기
        int heartCount = likeMapper.getLikeCount(projectNum);

        // PictureDTO 객체 생성 및 반환
        PictureDTO pictureDTO = projectMapper.getPicture(projectNum);
        pictureDTO.setHeartCount(heartCount);

        return pictureDTO;
    }
}
