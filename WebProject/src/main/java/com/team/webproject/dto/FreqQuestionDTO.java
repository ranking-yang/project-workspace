package com.team.webproject.dto;

import lombok.Data;

@Data
public class FreqQuestionDTO {
	/*
	QUESTION_CODE     NOT NULL NUMBER(10)     
	QUESTION_CATEGORY NOT NULL VARCHAR2(15)   
	QUESTION_TITLE    NOT NULL VARCHAR2(150)  
	QUESTION_CONTENT  NOT NULL VARCHAR2(3000)
	*/
	
	private Integer question_code;
	private String question_category;
	private String question_title;
	private String question_content;
	
	

}
