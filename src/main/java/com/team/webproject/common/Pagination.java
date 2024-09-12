package com.team.webproject.common;

import org.springframework.stereotype.Component;

@Component
public class Pagination {
	
	private int pageNum;
	private int maxNum;
	
	public int getMaxNum() {
		return maxNum;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getStart() {
		return this.getEnd() - 9;
	}
	
	public int getEnd() {
		return this.pageNum * 10;
	}
}
