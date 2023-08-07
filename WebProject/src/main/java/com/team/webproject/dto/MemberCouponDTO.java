package com.team.webproject.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MemberCouponDTO {
	/*
	MEMBER_COUPON_CODE NOT NULL NUMBER(10) 
	USER_CODE                   NUMBER(10) 
	COUPON_CODE                 NUMBER(10) 
	COUPON_STATE                NUMBER(1)  
	EXPIRY_DATE                 DATE   
	 */
	
	private Integer member_coupon_code;
	private Integer user_code;
	private Integer coupon_code;
	private Integer coupon_state;
	private Date expiry_date;

}
