package com.team.webproject.dto;

import java.sql.Date;

//import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private Integer review_code;
	private Integer review_writer_code; // 외래키
	private String reviewer_id;
	private String performance_code; // 외래키
	private Integer review_star;
	private String review_content;
	private Date review_date; // import util로 함
	private Integer review_like;
	private String review_image;
	private String review_id;
}
