package com.ggiri.root.message.service;

import java.util.List;

import com.ggiri.root.message.to.MessageTO;

public interface MessageService {

	public List<MessageTO> messageList(MessageTO to);
	public List<MessageTO> roomContentList(MessageTO to);
	public int messageSendList(MessageTO to);
}
