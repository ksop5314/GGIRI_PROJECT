
package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


public class ProjectRepDTO {
	
	private int memberNum;  // 회원 번호
	private int no; 		// 댓글 번호
	private int bno; 		// 게시물 번호
	private String id; 		// 회원ID
	private String content; // 내용
	private String wdate; 	// 작성일
	
	
	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getWdate() {
		return wdate;
	}
	
	public void setWdate(Timestamp wdate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.wdate = format.format(wdate);
	}
	
	
	
	
	
	
	
	
}
