package com.ggiri.root.member.dto;

public class GgiriFreeInsertDTO {
	
	private String id; // GgiriMember (Primary key) id
	private String introduce; // 자기소개
	private String project_name; // 프로젝트명
	private int project_period; // 프로젝트 기간
	private String project_cliente; // 고객사
	private String project_ex;	// 프로젝트 설명
	private String insertdate; // 작성일자
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public int getProject_period() {
		return project_period;
	}
	public void setProject_period(int project_period) {
		this.project_period = project_period;
	}
	public String getProject_cliente() {
		return project_cliente;
	}
	public void setProject_cliente(String project_cliente) {
		this.project_cliente = project_cliente;
	}
	public String getProject_ex() {
		return project_ex;
	}
	public void setProject_ex(String project_ex) {
		this.project_ex = project_ex;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	
	
	
}
