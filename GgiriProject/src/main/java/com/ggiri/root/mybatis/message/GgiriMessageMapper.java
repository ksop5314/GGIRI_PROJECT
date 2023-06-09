package com.ggiri.root.mybatis.message;

import java.util.List;

import com.ggiri.root.message.to.MessageTO;

public interface GgiriMessageMapper {

	public List<MessageTO> messageList(MessageTO to);
	public int countUnread(MessageTO mto);
	public  List<MessageTO> roomContentList(MessageTO to);
	public void updateReadChk(MessageTO to);
	public int existChat(MessageTO to);
	public int maxRoom(MessageTO to);
	public String selectRoom(MessageTO to);
	public int messageSendList(MessageTO to);
	
}
