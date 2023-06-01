package com.ggiri.root.chat.server;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver")
public class ChatServer {

	private static List<Session> list = new ArrayList<Session>();
	private void print(String message) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), message);
	}
	
	@OnOpen
	public void handleOpen(Session session) {
		print("클라이언트 연결");
		list.add(session);
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		
	}
}
