package com.ggiri.root.project.dto;

/*-- 좋아요 테이블
CREATE TABLE heart(
project_no number not null, -- 좋아요를 누를 해당 게시판 넘버 
memberNum number(20) not null, -- 해당 좋아요 누르는 아이디
like_check NUMBER DEFAULT 1,
CONSTRAINT heart_no foreign key(project_no) references ggiriproject(projectNum) on delete cascade,
CONSTRAINT heart_id FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);
*/

public class GgiriBoardLikeDTO {
	
	private int projectNum;
	private int memberNum;
	private int like_check;
	
	
	
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
	
	

	
	
	
	
	
}
