package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MDrecomDTO {
	private Integer md_code;
	private String md_title;
	private String md_genrenm;
	private String md_area;
	private Date md_period_start;
	private Date md_period_end;
	
}
