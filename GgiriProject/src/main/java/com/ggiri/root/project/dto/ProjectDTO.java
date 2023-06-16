package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectDTO {
	
	private int projectNum; // 프로젝트 번호
	private int memberNum;
	private String title; // 제목
	private String project; // 프로젝트 상황
	private String content; // 내용
	private String prodate; // 등록일
	private int proHit; // 조회수
	private String id; // 작성자 아이디
	private String skill;
    private int likeCount;
	// 페이징 필드
	private int pageNo; // 페이지 번호
	private int pageSize; // 페이지 크기
	
	// 좋아요
	// 현재사용자가 좋아요 누른건지 아닌지
	private String likeId;
	// 현재사용자가 즐겨찾기 누른건지 아닌지
	private String checkLike;
	// 현재 사용자 id
	private String userId;
	
	
	public ProjectDTO() {
		super();
	}
	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
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
	
	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
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
	
	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public void incrementLikeCount() {
        this.likeCount++;
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
	
	// 좋아요
	public String getLikeId() {
		return likeId;
	}

	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}

	public String getCheckLike() {
		return checkLike;
	}

	public void setCheckLike(String checkLike) {
		this.checkLike = checkLike;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
//	public int getPageNo() {
//		return pageNo;
//	}
//	
//	public void setPageNo(int pageNo) {
//		this.pageNo = pageNo;
//	}
//	
//	public int getPageSize() {
//		return pageSize;
//	}
//	
//	public void setPageSize(int pageSize) {
//		this.pageSize = pageSize;
//	}
}
