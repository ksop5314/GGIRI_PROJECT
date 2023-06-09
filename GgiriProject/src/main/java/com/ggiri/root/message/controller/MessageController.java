package com.ggiri.root.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.message.service.MessageService;
import com.ggiri.root.message.to.MessageTO;

@Controller
@RequestMapping("ggiriMessage")
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("messageList")
	public String messageList(HttpServletRequest request, HttpSession session) {
//		return "ggiriMessage/messageList";
		String nick = (String)session.getAttribute("loginUser");
		System.out.println("현재 사용자 : " + nick);
		
		MessageTO to = new MessageTO();
		to.setNick(nick);
		
		List<MessageTO> list = messageService.messageList(to);
		
		request.setAttribute("list", list);
		
		return "ggiriMessage/messageList";
//		return messageService.messageList(to);
	}
	
	@RequestMapping("messageAjax")
	@ResponseBody
	public List<MessageTO> messageAjax(HttpServletRequest request, HttpSession session) {
		
		String nick = (String)session.getAttribute("loginUser");
		
		MessageTO to = new MessageTO();
		to.setNick(nick);
		
		return messageService.messageList(to);
//		List<MessageTO> list = messageService.messageList(to);
//
//		request.setAttribute("list", list);
//		
//		return "ggiriMessage/messageAjax";
	}
	
	@RequestMapping("messageContent")
	@ResponseBody
	public List<MessageTO> messageContent(HttpServletRequest request, HttpSession session) {
		
		int room = Integer.parseInt(request.getParameter("room"));
		
		MessageTO to = new MessageTO();
		to.setRoom(room);
		to.setNick((String)session.getAttribute("loginUser"));
		
		return messageService.roomContentList(to);
		
//		List<MessageTO> clist = messageService.roomContentList(to);
//		
//		request.setAttribute("clist", clist);
//		
//		return "ggiriMessage/messageContent";
		
	}
	
	@RequestMapping("messageSendList")
	@ResponseBody
	public int messageSendList(@RequestParam int room, @RequestParam String otherNick, @RequestParam String content, HttpSession session) {
		
		MessageTO to = new MessageTO();
		to.setRoom(room);
		to.setSendNick((String)session.getAttribute("loginUser"));
		to.setRecvNick(otherNick);
		to.setContent(content);
		
		int flag = messageService.messageSendList(to);
		
		return flag;
	}
	
	
	
}
