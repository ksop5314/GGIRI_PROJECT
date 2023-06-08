package com.ggiri.root.message.to;

public class MessageTO {
	
	private String no;
	private int room;
	private String sendNick;
	private String recvNick;
	private String sendTime;
	private String readTime;
	private String content;
	private String readChk;
	
	private String otherNick;
	private String nick;
	private int unread;
	
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSendNick() {
		return sendNick;
	}
	public void setSendNick(String sendNick) {
		this.sendNick = sendNick;
	}
	public String getRecvNick() {
		return recvNick;
	}
	public void setRecvNick(String recvNick) {
		this.recvNick = recvNick;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getReadTime() {
		return readTime;
	}
	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadChk() {
		return readChk;
	}
	public void setReadChk(String readChk) {
		this.readChk = readChk;
	}
	public String getOtherNick() {
		return otherNick;
	}
	public void setOtherNick(String otherNick) {
		this.otherNick = otherNick;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	
}
