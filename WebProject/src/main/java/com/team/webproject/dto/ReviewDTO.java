package com.team.webproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private Integer review_code;
	private Integer review_writer_code;
	private String performance_code;
	private Integer review_star;
	private String review_content;
	private Date review_date; // import util로 함
	private Integer review_like;
}
