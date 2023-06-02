
package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
create table ggiriProject(
projectNum NUMBER(10) PRIMARY KEY,
title VARCHAR2(300),
content VARCHAR2(3000),
prodate DATE DEFAULT SYSDATE,
proHit NUMBER(10) DEFAULT 0,
id VARCHAR2(20) NOT NULL,
CONSTRAINT fk_ggiri FOREIGN KEY(id) REFERENCES ggiriMember(id) ON DELETE CASCADE
);
*/

public class ProjectDTO {

	private int projectNum;
	private String title;
	private String content;
	private String prodate;
	private int proHit;
	private String id;
	
	public ProjectDTO() {
		super();
	}

	public ProjectDTO(int projectNum, String title, String content, String prodate, int proHit,
			String id) {
		super();
		this.projectNum = projectNum;
		this.title = title;
		this.content = content;
		this.prodate = prodate;
		this.proHit = proHit;
		this.id = id;
	}

	public int getProjectNum() {
		return projectNum;
	}
	
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
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
	
	public String getProdate() {
		return prodate;
	}
	
	public void setProdate(Timestamp prodate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		this.prodate = format.format(prodate);
	}
	
	public int getProHit() {
		return proHit;
	}
	
	public void setProHit(int proHit) {
		this.proHit = proHit;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	
}
