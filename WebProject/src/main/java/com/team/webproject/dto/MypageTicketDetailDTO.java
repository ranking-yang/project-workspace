package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MypageTicketDetailDTO {

	// 예매 티켓
	private Date booking_date;
	private String booking_time;

	// 공연
	private String performance_code;
	private String performance_name;
	private String poster;
	private String place;

	// 결제
	private String payment_code;
	private Date payment_date;
	private Integer total_price;

}
