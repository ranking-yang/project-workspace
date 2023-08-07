package com.team.webproject.mapper;

import com.team.webproject.dto.MemberCouponDTO;

public interface CouponMapper {
	
	int getMemberCode();
	
	int insertCoupon(MemberCouponDTO memberCoupon);
	
}
