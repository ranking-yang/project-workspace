package com.team.webproject.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class MemberCouponDTO {
	
	// 값을 입력할 때만 사용하는 속성
	private Integer member_coupon_code;
	private Integer user_code;
	private Integer coupon_code;
	private Integer coupon_state;
	private Date expiry_date;
	
	
	// 값을 받아올 때 추가적으로 넣는 속성
	private String coupon_name;
	private Double discount_rate;
	private Integer discount_money;
	private Integer coupon_qty;
}
