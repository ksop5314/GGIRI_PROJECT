
package com.ggiri.root.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.service.ProjectService;
import com.ggiri.root.project.service.ReplyService;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriProject")
public class ReplyController implements GgiriMemberSession {

	@Autowired
	private ReplyService rs;
	
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
		int rep = rs.addReplyTest(dto);

		return rep;
		
	}
    
    @GetMapping(value="replyData", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") String bno) {
		
		return rs.getRepList(Integer.parseInt(bno));
		
	}
    
    
    // 대댓글
	
//	@PostMapping("re_addReply")
//    @ResponseBody
//	public int re_addReply(@RequestBody Map<String, Object> map, HttpSession session) {
//		
//		ReprepDTO dto = new ReprepDTO();
//		
//		String projectNum = (String) map.get("projectNum");
//		System.out.println(projectNum);
//		String id = (String)map.get("id");
//		dto.setId((String)session.getAttribute(LOGIN));
//		dto.setBno(Integer.parseInt((String) map.get("projectNum")));
//		dto.setId((String)session.getAttribute("id"));
//		dto.setNo(Integer.parseInt((String) map.get("projectNum")));
//		dto.setContent((String)map.get("content"));
//		
//		int re_rep = ps.re_addReplyTest(dto);
//		
//
//		return re_rep;
//	}
// 
//	@GetMapping(value="re_replyData", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public List<ReprepDTO> re_replyData(@RequestParam("projectNum") String r_bno) {
//		
//		return ps.re_getRepList(Integer.parseInt(r_bno));
//		
//	}
    
    // 수정
    @PostMapping("re_modify")
    public String re_modify(ProjectRepDTO dto) {
        rs.re_modify(dto);
        return "redirect:/ggiriProject/projectView";
    }
    
    
		
	// 삭제
	@GetMapping("re_delete")
    public String delete(@RequestParam("memberNum") int memberNum) {
        rs.delete(memberNum);
        return "redirect:/ggiriProject/projectView";
    }
	
	
}
