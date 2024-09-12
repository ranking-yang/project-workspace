package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentDTO {
	
	String payment_code;
	Integer related_coupon;
	String payment_way;
	Date payment_date;
	Integer total_price;

}
