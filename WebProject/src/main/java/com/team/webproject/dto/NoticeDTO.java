package com.team.webproject.dto;

import java.util.Date;

public class NoticeDTO {
	private int notice_code;
	private Integer admin_code;
	private String notice_title;
	private String notice_content;
	private int notice_level;
	private Date notice_date;
	
	
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public Integer getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(Integer admin_code) {
		this.admin_code = admin_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_level() {
		return notice_level;
	}
	public void setNotice_level(int notice_level) {
		this.notice_level = notice_level;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
	
	
}
