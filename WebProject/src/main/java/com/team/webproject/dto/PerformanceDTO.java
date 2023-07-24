package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class PerformanceDTO {
	private String performance_code;
	private String performance_name;
	private int performance_qty;
	private String main_category;
	private String sub_category;
	private int performance_price;
	private Date start_date;
	private Date end_date;
	private String address;
	private String place;
	private char kid_state;
	private String poster;

}
