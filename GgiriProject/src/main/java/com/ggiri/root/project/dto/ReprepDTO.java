
package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
-- 대댓글 테이블
CREATE TABLE re_reply (
r_no NUMBER(10) not null,        -- 대댓글 번호
r_bno NUMBER(10) not null,       -- 게시물 번호
id VARCHAR2(100) not null,       -- 회원ID
content VARCHAR2(1000),          -- 내용
rdate DATE DEFAULT SYSDATE,      -- 작성일
CONSTRAINT fk_test3 FOREIGN KEY(r_bno) REFERENCES ggiriProject(projectNum) ON DELETE CASCADE,
CONSTRAINT fk_test4 FOREIGN KEY(id) REFERENCES ggiriMember(id) ON DELETE CASCADE
);
*/

public class ReprepDTO {

	private int r_no;
	private int r_bno;
	private String id;
	private String content;
	private String rdate;
	
	public int getR_no() {
		return r_no;
	}
	
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
	public int getR_bno() {
		return r_bno;
	}
	
	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
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
		return rdate;
	}
	
	public void setRdate(Timestamp rdate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.rdate = format.format(rdate);
	}
	
	
	
	
}
