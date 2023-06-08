package com.ggiri.root.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggiri.root.message.to.MessageTO;
import com.ggiri.root.mybatis.message.GgiriMessageMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	GgiriMessageMapper mapper;
	
	@Override
	public List<MessageTO> messageList(MessageTO to) {
		
		String nick = to.getNick();
		
		List<MessageTO> list = mapper.messageList(to);
		
		for(MessageTO mto : list) {
			mto.setNick(nick);
			
			int unread = mapper.countUnread(mto);
			mto.setUnread(unread);
			
			if(nick.equals(mto.getSendNick())) {
				mto.setOtherNick(mto.getRecvNick());
			} else {
				mto.setOtherNick(mto.getSendNick());
			}
		}
		
		return list;
	}
	
	public List<MessageTO> roomContentList(MessageTO to){
		
		System.out.println("room : " + to.getRoom());
		System.out.println("recvNick : " + to.getRecvNick());
		System.out.println("nick : " + to.getNick());
		
		List<MessageTO> clist = mapper.roomContentList(to);
		
		mapper.updateReadChk(to);
		
		return clist;
		
	}
	
	public int messageSendList(MessageTO to) {
		if(to.getRoom() == 0) {
			int existChat = mapper.existChat(to);
			
			if(existChat == 0) {
				int maxRoom = mapper.maxRoom(to);
				to.setRoom(maxRoom+1);
			} else {
				int room = Integer.parseInt(mapper.selectRoom(to));
				to.setRoom(room);
			}
		}
		
		int flag = mapper.messageSendList(to);
		return flag;
	}
	
	
}
