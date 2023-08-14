package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PerfomSaleDTO {
	private String payment_code;
	private Date payment_date;
	private String performance_code;
	private char advance_ticket_state;
	private String performance_name;
	private String main_category;
}
