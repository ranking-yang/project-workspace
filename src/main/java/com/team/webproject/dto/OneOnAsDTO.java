package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OneOnAsDTO {
	private Integer one_code;
	private Integer writer_code;
	private String one_title;
	private String one_content;
	private Integer one_state;
	private Date one_date;
	private String one_answer;
	private Date answer_date;
}
