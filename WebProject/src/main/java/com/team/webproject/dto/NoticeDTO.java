package com.team.webproject.dto;


import java.sql.Date;

import lombok.Data;
@Data
public class NoticeDTO {
	private int notice_code;
	private Integer admin_code;
	private String notice_title;
	private String notice_content;
	private int notice_level;
	private Date notice_date;
	
}
