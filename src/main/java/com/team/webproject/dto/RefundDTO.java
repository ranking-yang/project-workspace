package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class RefundDTO {
	private Integer refund_code;
	private String payment_code;
	private Date refund_date;
	private String refund_status;
	private Date payment_date;
	private Integer related_coupon;
	private String payment_way;
	private Integer total_price;
	private String member_id;
	private Integer member_code;
	private String performance_name;
	
}
