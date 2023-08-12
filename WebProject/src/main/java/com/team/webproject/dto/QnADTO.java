package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QnADTO {
	private int qa_code;
	private int qa_writer_code;
	private String qa_writer_id;
	private String performance_code;
	private String qa_content;
	private Date qa_date;
	private String qa_answer;
	private int qa_secret;
	
}
