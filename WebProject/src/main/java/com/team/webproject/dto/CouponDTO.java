package com.team.webproject.dto;

import lombok.Data;

@Data
public class CouponDTO {
	/*
	COUPON_CODE    NOT NULL NUMBER(10)   
	COUPON_NAME    NOT NULL VARCHAR2(30) 
	DISCOUNT_RATE           NUMBER(2,2)  
	DISCOUNT_MONEY          NUMBER(5)    
	COUPON_QTY              NUMBER(5)   
	*/
	
	private Integer coupon_code;
	private String coupon_name;
	private Double discount_rate;
	private Integer discount_money;
	private Integer coupon_qty;

}
