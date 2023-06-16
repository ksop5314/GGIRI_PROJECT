
package com.ggiri.root.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.mybatis.member.GgiriMemberMapper;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.service.ProjectService;
import com.ggiri.root.project.service.ProjectServiceImpl;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriProject")
public class ProjectController implements GgiriMemberSession{
	
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private GgiriFreeInsertService gfs;

	@Autowired
	private GgiriService gs;
	
	@Autowired
	private GgiriMemberMapper gmm;
	
	
    @RequestMapping("projectWrite")
    public String proWrite(HttpSession session, Model model) {
    	if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		}
        return "ggiriProject/projectWrite";
    }


    @GetMapping("projectView")
    public String projectView(@RequestParam("projectNum") int projectNum, Model model, HttpSession session) throws Exception {
       GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
       Dto.setProjectNum(projectNum);
       Dto.setLike_check(0);
       int a = ps.select_heart(Dto);
       model.addAttribute("likeCount",a);
    	
    	
    	if(session.getAttribute(LOGIN) != null) {
         String id = (String)session.getAttribute(LOGIN);
         gs.ggiriMemberInfo(id, model);         
         ps.projectView(projectNum, model);
           return "ggiriProject/projectView";
      } else if(session.getAttribute("kakaoMember") != null){
         GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
         ps.projectView(projectNum, model);
         gs.ggiriSnsInfo(dto.getId(), model);
           return "ggiriProject/projectView";
      } else if(session.getAttribute("naverMember") != null){
         GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
         ps.projectView(projectNum, model);
         gs.ggiriSnsInfo(dto.getId(), model);
           return "ggiriProject/projectView";
      } else if(session.getAttribute("googleMember") != null){
         GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
         //ps.modalContent(projectNum, model);
         ps.projectView(projectNum, model);
         gs.ggiriSnsInfo(dto.getId(), model);
           return "ggiriProject/projectView";
      }
        return "ggiriProject/projectView";
    }

    @PostMapping("projectSave")
    public String projectSave(ProjectDTO dto) {
        int a = ps.insertPro(dto);
        if(a == 1) {
        	return "redirect:projectSuccess";
        }
        return "redirect:projectFail";
    }
    
    @GetMapping("projectSuccess")
    public String projectSuccess() {
    	return "ggiriProject/projectSuccess";
    }
    
    @GetMapping("projectFail")
    public String projectFail() {
    	return "ggiriProject/projectFail";
    }
    
    @GetMapping("modifyForm")
    public String modifyForm(@RequestParam("projectNum") int projectNum, Model model) {
        ps.projectView(projectNum, model);
        return "ggiriProject/modifyForm";
    }

    @PostMapping("modify")
    public String modify(ProjectDTO dto) {
        ps.modify(dto);
        return "redirect:/ggiriProject/projectList";
    }

    @GetMapping("delete")
    public String delete(@RequestParam("projectNum") int projectNum) {
        ps.delete(projectNum);
        return "redirect:/ggiriProject/projectList";
    }

    @GetMapping("projectList")
    public String projectList(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "condition", defaultValue = "title") String condition,
        Model model, HttpSession session
    )throws Exception  {
        int perPage = 10; // 한 페이지에 보여줄 프로젝트 개수
        
        if (keyword != null && !keyword.isEmpty()) {
            // 검색어가 입력된 경우 검색 기능 적용
            int totalCount = ps.getProjectCountBySearch(keyword, condition);
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            int startRow = (page - 1) * perPage + 1;
            int endRow = startRow + perPage - 1;
            List<ProjectDTO> projectList = ps.getProjectListBySearch(keyword, condition, startRow, endRow);
            
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        } else {
            // 검색어가 없는 경우 전체 프로젝트 목록 조회
            List<ProjectDTO> projectList = ps.getProjectList(page, perPage);
            int totalCount = ps.getProjectCount();
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        }
        if(session.getAttribute(LOGIN) == null) {
        	String id = (String)session.getAttribute(LOGIN);
        	List<Map<String, Object>> list = ps.selectJob(model);
        	gfs.ggiriMemberJob(model);			
	        return "ggiriProject/projectList";
        }
        if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			List<Map<String, Object>> list = ps.selectJob(model);
			gfs.ggiriMemberJob(model);			
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		}
        return "ggiriProject/projectList";
    }

    
    
    // 댓글
    @PostMapping("addReply")
    @ResponseBody
	public int addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		ProjectRepDTO dto = new ProjectRepDTO();
		
		String projectNum = (String) map.get("projectNum");
		System.out.println(projectNum);
		String id = (String)map.get("id");
		System.out.println(id);
		String content = (String)map.get("content");
		System.out.println(content);
		
		dto.setId((String)map.get("id"));
		dto.setMemberNum(Integer.parseInt((String)map.get("memberNum")));
		dto.setBno(Integer.parseInt((String)map.get("projectNum")));
		dto.setContent(content);
		int rep = ps.addReplyTest(dto);
		
		return rep;
	}
    
    @GetMapping("repDelete")
    @ResponseBody
    public String repDelete(@RequestParam("no") int no) {
    	ps.repDelete(no);
    	return "OK";
    }
    
	@GetMapping("replyData")
	@ResponseBody
	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") int bno) {
		
		return ps.getRepList(bno);
		
	}
	
	// 좋아요
	@PostMapping(value="like_check/{projectNum}", produces="application/json; charset=utf-8")
	@ResponseBody
	public int like(@PathVariable("projectNum") String projectNum,@RequestParam("memberNum") int memberNum){

		System.err.println("글번호 : " + projectNum);
		
		GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
		dto.setMemberNum(memberNum); 
		
		System.out.println(projectNum);
		System.out.println(memberNum);
		
//		dto.setProjectNum(Integer.parseInt((String)map.get(projectNum)));
		dto.setLike_check(1);
//		System.out.println("번호 : " + projectNum);
//		System.out.println("맴버번호 : "+ (GgiriMemberDTO)gmm.ggiriMemberInfo());
//		ps.like_check(Integer.parseInt(projectNum), (String)session.getAttribute(LOGIN));
//		GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
//		dto.setMemberNum((String)session.getAttribute(LOGIN));
//		dto.setLike_check(1);
//		dto.setProjectNum(Integer.parseInt(projectNum));
		return ps.select_heart(dto);
	}
	@PostMapping("modifyModalRep")
	@ResponseBody
	public String modifyModalRep(@RequestBody ProjectRepDTO dto) {
		ps.modifyModalRep(dto);
		return "OK";
	}
	
}