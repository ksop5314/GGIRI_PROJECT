
package com.ggiri.root.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private ProjectServiceImpl projectService;

	
    @RequestMapping("projectWrite")
    public String proWrite() {
        return "ggiriProject/projectWrite";
    }

    @GetMapping("projectView")
    public String projectView(@RequestParam("projectNum") int projectNum, Model model, HttpSession session) {
        ps.projectView(projectNum, model);

//        // likeId 값 설정
//        String id = (String) session.getAttribute("loginUser");
//        int likeId = projectService.getLikeIdByUser(projectNum, id);
//        model.addAttribute("likeId", likeId);

        return "ggiriProject/projectView";
    }

    @PostMapping("projectSave")
    public String projectSave(ProjectDTO dto) {
        ps.insertPro(dto);
        return "redirect:/ggiriProject/projectList";
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
        Model model
    ) {
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

        return "ggiriProject/projectList";
    }
    
  //게시물 추천 관련 메소드
    @RequestMapping("/board/recommend.do")
    public String recommend (@RequestParam int member_bno) throws Exception {
        
        projectService.recommend(member_bno);
    
        return "forward:/board/list.do"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
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
		
		dto.setId((String)map.get("id"));
		dto.setBno(Integer.parseInt((String)map.get("projectNum")));
		dto.setContent((String)map.get("content"));
		int rep = ps.addReplyTest(dto);
		
		
//		String loginUser = (String)session.getAttribute("loginUser");
//		System.out.println(loginUser);
//		String kakaoid = (String)session.getAttribute("kakaoMember");
//		System.out.println(kakaoid);
//		String naverid = (String)session.getAttribute("naverMember");
//		System.out.println(naverid);
		
//		if( id == kakaoid) {
//			dto.setId(kakaoid);
//			dto.setBno(Integer.parseInt((String)map.get("projectNum")));
//			dto.setContent((String)map.get("content"));
//			int rep = ps.addReplyTest(dto);
//			return rep;
//		} else if(id == naverid) {
//			dto.setId(naverid);
//			dto.setBno(Integer.parseInt((String)map.get("projectNum")));
//			dto.setContent((String)map.get("content"));
//			int rep = ps.addReplyTest(dto);
//			return rep;
//		} else if(id == loginUser){
//			dto.setId(loginUser);
//			dto.setBno(Integer.parseInt((String)map.get("projectNum")));
//			dto.setContent((String)map.get("content"));
//			int rep = ps.addReplyTest(dto);
//			return rep;
//		} else {
//			System.out.println("댓글 등록 아이디값 가져오기 실패");
//		}
		
		return rep;
		//dto.setGrp(map.get());
		
	}
    
	@GetMapping(value="replyData", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") String bno) {
		
		return ps.getRepList(Integer.parseInt(bno));
		
	}
    
    // 대댓글
	
	@PostMapping("re_addReply")
    @ResponseBody
	public int re_addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		ProjectRepDTO dto = new ProjectRepDTO();
		
		String projectNum = (String) map.get("projectNum");
		System.out.println(projectNum);
		String id = (String)map.get("id");
		
		dto.setId((String)session.getAttribute("id"));
		dto.setBno(Integer.parseInt((String) map.get("projectNum")));
		//dto.setGrp(Integer.parseInt((String) map.get(grp)));
		//dto.setGrps(Integer.parseInt((String) map.get("grps")));
		//dto.setGrpl(Integer.parseInt((String) map.get("grpl")));
		dto.setContent((String)map.get("content"));
		
		int re_rep = ps.re_addReplyTest(dto);
		

		return re_rep;
	}
 
	@GetMapping(value="re_replyData", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectRepDTO> re_replyData(@RequestParam("projectNum") String bno) {
		
		return ps.re_getRepList(Integer.parseInt(bno));
		
	}
    
    /*
    String projectNum = (String) map.get("projectNum");
		System.out.println(projectNum);
		
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setBno(Integer.parseInt((String)map.get("projectNum")));
		dto.setGrp(Integer.parseInt((String)map.get("grp")));
		dto.setGrp(Integer.parseInt((String)map.get("grps")));
		dto.setGrp(Integer.parseInt((String)map.get("grpl")));
		dto.setContent((String)map.get("content"));
		
		int re_rep = ps.re_addReplyTest(dto);
		
		return re_rep;
    */
	
}