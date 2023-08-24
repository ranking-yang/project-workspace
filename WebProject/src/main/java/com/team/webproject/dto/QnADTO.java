package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QnADTO {
	private int qa_code;
	private Integer qa_writer_code;
	private String qa_writer_id;
	private String performance_code;
	private String qa_content;
	private Date qa_date;
	private String qa_answer;
	private Integer qa_secret;
	private String performance_name;
	private String main_category;
	
}
