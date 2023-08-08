package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MypageTicketDTO {
	
	// 공연
	private String poster;
	private String performance_name;
	
	// 예매 티켓
	Date booking_date;
	String booking_time;
	int booking_total_qty;
	
	// 결제
	Date payment_date;
	Integer total_price;
	
	// 리뷰 여부
	Integer review_check;

}
