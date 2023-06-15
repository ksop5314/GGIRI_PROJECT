package com.ggiri.root.mybatis.project;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.LikeDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ProjectMapper {

    List<ProjectDTO> projectList();
    
    ProjectDTO projectView(int projectNum);
    
    int insertPro(ProjectDTO dto);
    
    void proHit(int projectNum);
    
    void modify(ProjectDTO dto);
    
    void delete(int projectNum);

    List<ProjectDTO> search(@Param("keyword") String keyword, @Param("condition") String condition);

    int getProjectCountBySearch(@Param("keyword") String keyword, @Param("condition") String condition);

    List<ProjectDTO> getProjectListBySearch(@Param("keyword") String keyword, @Param("condition") String condition,
                                           @Param("startRow") int startRow, @Param("endRow") int endRow);

    List<ProjectDTO> getProjectList(int startRow, int endRow);

    int getProjectCount();

    List<ProjectDTO> getProjectList(Map<String, Object> params);

    int getProjectCountBySearch(Map<String, Object> searchParams);

    List<ProjectDTO> getProjectListBySearch(Map<String, Object> searchParams);
    
    List<ProjectDTO> searchByTitleAndContent(@Param("keyword") String keyword);

    List<ProjectDTO> searchByTitle(@Param("keyword") String keyword);

    List<ProjectDTO> searchByAuthor(@Param("keyword") String keyword);

    void setLikeCount(@Param("projectNum") int projectNum, @Param("likeCount") int likeCount);

    void likeUp(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void likeDown(@Param("board_no") int board_no, @Param("user_no") int user_no);

    int isProjectLikedByUser(@Param("projectNum") int projectNum, @Param("user_no") int user_no);

    void insertLike(@Param("projectNum") int projectNum, @Param("user_no") int user_no);

    void deleteLike(@Param("projectNum") int projectNum, @Param("user_no") int user_no);
    
    int getLikeCount(int projectNum);

    void increaseLikeCount(int projectNum);

    void increaseLikeCountByUser(@Param("projectNum") int projectNum, @Param("id") String id);

	int getLikeIdByUser(int projectNum, String id);

	LikeDTO getPicture(String projectNum);
	
    // 관리자 페이지
    public List<ProjectDTO> adminProjectList();
    public void proDelete(int projectNum);
    public List<ProjectRepDTO> adminReplyList();
    
    // 댓글
//    public void addReply(ProjectRepDTO dto);
    public int addReplyTest(ProjectRepDTO dto);
	public List<ProjectRepDTO> getRepList(int bno);
    
    
}
