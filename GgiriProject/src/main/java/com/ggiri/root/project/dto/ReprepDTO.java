
package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
-- 대댓글 테이블
CREATE TABLE reGgiriReply (
memberNum NUMBER(20),
reno NUMBER(10) primary key,        -- 대댓글 번호
no NUMBER(10) not null,          -- 댓글 번호
bno NUMBER(10) not null,         -- 게시물 번호
id VARCHAR2(100) not null,       -- 회원ID
content VARCHAR2(1000),          -- 내용
wdate DATE DEFAULT SYSDATE,      -- 작성일
CONSTRAINT fk_rep3 FOREIGN KEY(no) REFERENCES ggiriReply(no) ON DELETE CASCADE,
CONSTRAINT fk_rep4 FOREIGN KEY(bno) REFERENCES ggiriProject(projectNum) ON DELETE CASCADE,
CONSTRAINT fk_rep5 FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);
*/

public class ReprepDTO {

	private int memberNum;
	private int reno;
	private int no;
	private int bno;
	private String id;
	private String content;
	private String wdate;
	
	
	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
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
	
	public String getRdate() {
		return wdate;
	}
	
	public void setRdate(Timestamp wdate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.wdate = format.format(wdate);
	}
	
	
	
	
}
