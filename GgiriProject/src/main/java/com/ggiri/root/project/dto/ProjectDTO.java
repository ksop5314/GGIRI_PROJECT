package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectDTO {

	private int projectNum; // 프로젝트 번호
	private String title; // 제목
	private String content; // 내용
	private String prodate; // 등록일
	private int proHit; // 조회수
	private String id; // 작성자 아이디
	
	// 페이징 필드
	private int pageNo; // 페이지 번호
	private int pageSize; // 페이지 크기
	
	public ProjectDTO() {
		super();
	}

	public ProjectDTO(int projectNum, String title, String content, String prodate, int proHit, String id) {
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
	
	// 페이징 필드 getter/setter
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
