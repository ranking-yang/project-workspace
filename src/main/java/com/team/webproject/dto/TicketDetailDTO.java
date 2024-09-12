package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TicketDetailDTO {
	
	// 예매 티켓
	private Date booking_date;
	private String booking_time;
	private int booking_total_qty;
	private String advance_ticket_state;
	
	// 공연
	private String performance_code;
	private String performance_name;
	private String main_category;
	private String poster;
	private String place;
	private String address;
	
	// 결제
	private String payment_code;
	private Date payment_date;
	private Integer total_price;
	private String payment_way;
	
	// 쿠폰
	private String coupon_name;
	
	private Integer review_code;
	

}
