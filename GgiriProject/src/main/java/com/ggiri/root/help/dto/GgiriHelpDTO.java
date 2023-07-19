package com.ggiri.root.help.dto;

import java.sql.Date;

public class GgiriHelpDTO {
	
	private int helpNo;
	private int memberNum;
	private String id;
	private String title;
	private String content;
	private Date helpDate;
	
	
	
	public int getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(int helpNo) {
		this.helpNo = helpNo;
	}
	public Date getHelpDate() {
		return helpDate;
	}
	public void setHelpDate(Date helpDate) {
		this.helpDate = helpDate;
	}
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
