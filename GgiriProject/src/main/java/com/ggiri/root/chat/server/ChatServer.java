package com.ggiri.root.chat.server;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
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
	public void handleMessage(String message, Session session) {
		
		int index = message.indexOf("#", 2);
		String no = message.substring(0, 1);
		String user = message.substring(2, index);
		String txt = message.substring(index + 1);
		
		if(no.equals("1")) {
			for(Session s : list) {
				if(s != session) {
					try {
						s.getBasicRemote().sendText("1#" + user + "#");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} else if(no.equals("2")) {
			
			for(Session s : list) {
				if(s != session) {
					try {
						s.getBasicRemote().sendText("2#" + user + " : " + txt);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
		} else if(no.equals("3")) {
			
			for(Session s : list) {
				if(s != session) {
					try {
						s.getBasicRemote().sendText("3#" + user + "#");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			list.remove(session);
		}
		
	}
	
	@OnClose
	public void handleClose() {
		
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}
}
