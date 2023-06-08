package com.ggiri.root.project.VO;

public class LikeVO {
	
	private String ltmid;
	private int ltbid;
	private int ltlike;
	private int count;//좋아요가 눌린 상태인가 아닌가.
	@Override
	public String toString() {
		return "LikeBean [ltmid=" + ltmid + ", ltbid=" + ltbid + ", ltlike=" + ltlike + ", count=" + count + "]";
	}
	public String getLtmid() {
		return ltmid;
	}
	public void setLtmid(String ltmid) {
		this.ltmid = ltmid;
	}
	public int getLtbid() {
		return ltbid;
	}
	public void setLtbid(int ltbid) {
		this.ltbid = ltbid;
	}
	public int getLtlike() {
		return ltlike;
	}
	public void setLtlike(int ltlike) {
		this.ltlike = ltlike;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}