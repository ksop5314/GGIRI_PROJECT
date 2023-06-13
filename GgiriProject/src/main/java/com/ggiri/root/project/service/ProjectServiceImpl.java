package com.ggiri.root.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.mybatis.project.ProjectMapper;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper pm;

    @Override
    public void projectList(Model model) {
        model.addAttribute("projectList", pm.projectList());
    }

    @Override
    public void projectView(int projectNum, Model model) {
        model.addAttribute("data", pm.projectView(projectNum));
        pm.proHit(projectNum);
    }

    @Override
    public void insertPro(ProjectDTO dto) {
        pm.insertPro(dto);
    }

    @Override
    public void modify(ProjectDTO dto) {
        pm.modify(dto);
    }

    @Override
    public void delete(int projectNum) {
        pm.delete(projectNum);
    }

    @Override
    public List<ProjectDTO> search(String keyword, String searchType) {
        return pm.search(keyword, searchType);
    }

    @Override
    public int getProjectCountBySearch(String keyword, String searchType) {
        return pm.getProjectCountBySearch(keyword, searchType);
    }

    @Override
    public List<ProjectDTO> getProjectListBySearch(String keyword, String searchType, int startRow, int endRow) {
        return pm.getProjectListBySearch(keyword, searchType, startRow, endRow);
    }

    @Override
    public List<ProjectDTO> getProjectList(int page, int perPage) {
        int startRow = (page - 1) * perPage + 1;
        int endRow = startRow + perPage - 1;
        return pm.getProjectList(startRow, endRow);
    }

    @Override
    public int getProjectCount() {
        return pm.getProjectCount();
    }

    @Override
    public void increaseLikeCount(int projectNum) {
        pm.increaseLikeCount(projectNum);
    }

    @Override
    public void increaseLikeCountByUser(int projectNum, String id) {
        pm.increaseLikeCountByUser(projectNum, id);
    }

    public int getLikeIdByUser(int projectNum, String id) {
        return pm.getLikeIdByUser(projectNum, id);
    }


    // 댓글
//    @Override
//	public void addReply(ProjectRepDTO dto) {
//		pm.addReply(dto);
//	}

    @Override
    public int addReplyTest(ProjectRepDTO dto) {
    	
    	return pm.addReplyTest(dto);
    }
    
	@Override
	public List<ProjectRepDTO> getRepList(int bno) {
		return pm.getRepList(bno);
	}
    
	// 대댓글
	@Override
	public int re_addReplyTest(ProjectRepDTO dto) {
		return pm.re_addReplyTest(dto);
	}
    
	@Override
	public List<ProjectRepDTO> re_getRepList(int bno) {
		return pm.re_getRepList(bno);
	}

    //게시글 추천관련 메소드 구현
    @Override
    public void recommend(int member_bno) throws Exception {
       return;
        
    }
 
}

