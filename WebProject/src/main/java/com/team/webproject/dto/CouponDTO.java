package com.team.webproject.dto;

import lombok.Data;

@Data
public class CouponDTO {
	
	private Integer coupon_code;
	private String coupon_name;
	private Double discount_rate;
	private Integer discount_money;
	private Integer coupon_qty;

}
