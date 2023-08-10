package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MypageRefundDTO {
	
	// 예매 티켓
	private Date booking_date;
	private String booking_time;
	private Integer booking_total_qty;

	// 공연
	private String performance_name;
	private String poster;

	// 환불정보
	private Integer refund_code;
	private Date refund_date;
	private String refund_status;
	
	// 결제정보
	private Integer total_price;
}
