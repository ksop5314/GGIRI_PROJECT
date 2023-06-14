
package com.ggiri.root.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriService;
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
	
	@Autowired
	private GgiriService gs;
	
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
    
//    @GetMapping(value="replyData", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") String bno) {
//		
//		return rs.getRepList(Integer.parseInt(bno));
//		
//	}
    
    
    @GetMapping(value="replyData", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") String bno) {
		
		return rs.getRepList(Integer.parseInt(bno));
		
	}
    
	
}
