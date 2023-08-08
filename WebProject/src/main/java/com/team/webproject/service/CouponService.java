package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.MemberCouponDTO;

public interface CouponService {
	
	int saveCouponIntoNewUser();
	
	List<MemberCouponDTO> getAllCoupon(String user_id);
	
	int getTheNumberOfCoupon(String user_id);
	
	boolean checkIfBirthDayCouponExists(String user_id);
	
	int giveBirthDayCoupon(String user_id);
	
}
