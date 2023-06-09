
package com.ggiri.root.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.service.ProjectService;
<<<<<<< HEAD
import com.ggiri.root.project.service.ProjectServiceImpl;
=======
import com.ggiri.root.session.login.GgiriMemberSession;
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git

@Controller
@RequestMapping("ggiriProject")
<<<<<<< HEAD
public class ProjectController {

=======
public class ProjectController implements GgiriMemberSession{
	
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git
	@Autowired
	private ProjectService ps;
<<<<<<< HEAD
	
	@Autowired
	private ProjectServiceImpl projectService;
=======
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git

	
    @RequestMapping("projectWrite")
    public String proWrite() {
        return "ggiriProject/projectWrite";
    }

    @GetMapping("projectView")
<<<<<<< HEAD
    public String projectView(@RequestParam("projectNum") int projectNum, Model model, HttpSession session) {
=======
    public String projectView(@RequestParam("projectNum") int projectNum, Model model) throws Exception {
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git
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
    
    
<<<<<<< HEAD
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

//    @PostMapping("/project/increase-like-count/{projectNum}")
//    @ResponseBody
//    public ResponseEntity<String> increaseLikeCount(@PathVariable("projectNum") int projectNum, HttpSession session) {
//        String id = (String) session.getAttribute("id");
//        try {
//            projectService.increaseLikeCountByUser(projectNum, id);
//            return ResponseEntity.ok("좋아요 개수가 증가되었습니다.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body("좋아요 개수 증가에 실패했습니다.");
//        }
//    }

    
//    @GetMapping("/projectList")
//    public String projectList(Model model) {
//        projectService.projectList(model);
//        return "project/projectList";
//    }

//    @GetMapping("/projectView/{projectNum}")
//    public String projectView(@PathVariable("projectNum") int projectNum, Model model) {
//        projectService.projectView(projectNum, model);
//        return "project/projectView";
//    }
//
//    @PostMapping("/increase-like-count/{projectNum}")
//    @ResponseBody
//    public String increaseLikeCount(@PathVariable("projectNum") int projectNum, HttpSession session) {
//        String id = (String) session.getAttribute("id");
//        projectService.increaseLikeCountByUser(projectNum, id);
//        return "success";
//    }
//    
=======
    // 댓글
    @PostMapping("addReply")
    @ResponseBody
	public int addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		ProjectRepDTO dto = new ProjectRepDTO();
		
		String projectNum = (String) map.get("projectNum");
		System.out.println(projectNum);
		
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setBno(Integer.parseInt((String)map.get("projectNum")));
		//dto.setGrp(map.get());
		dto.setContent((String)map.get("content"));
		
		int rep = ps.addReplyTest(dto);
		

		return rep;
	}
    
    //value="addReply", produces="application/json; charset=UTF-8"
    /*
    @PostMapping("addReply")
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
    	ProjectRepDTO dto = new ProjectRepDTO();
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setWrite_num(Integer.parseInt((String)map.get("projectNum")));
		dto.setContent((String)map.get("content"));
		
		ps.addReply(dto);
		
		return "redirect:projectView";
	}
    */
    
    //value="replyData", produces="application/json; charset=UTF-8"
    //@PathVariable int write_num
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
		String grp = (String) map.get("grp");
		String grps = (String) map.get("grps");
		String grpl = (String) map.get("grpl");
		System.out.println(projectNum);
		System.out.println(grp);
		System.out.println(grps);
		System.out.println(grpl);
		
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setBno(Integer.parseInt((String) map.get("projectNum")));
		dto.setGrp(Integer.parseInt((String) map.get(grp)));
		dto.setGrps(Integer.parseInt((String) map.get("grps")));
		dto.setGrpl(Integer.parseInt((String) map.get("grpl")));
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
	
	
	
    
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git
}