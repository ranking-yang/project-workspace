package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.CouponDTO;
import com.team.webproject.dto.MemberCouponDTO;

public interface CouponService {
	
	int saveCouponIntoNewUser();
	
	List<MemberCouponDTO> getAllCoupon(String user_id);
	
	int getTheNumberOfCoupon(String user_id);
	
	boolean checkIfBirthDayCouponExists(String user_id);
	
	int giveBirthDayCoupon(String user_id);
	
	List<CouponDTO> getAllCouponList();
	
	int addNewCoupon(String coupon_name, String coupon_qty, String discount);
	
	CouponDTO getNewestCoupon();
	
	int deleteSelectedCoupon(String coupon_code);
	
	int updateSelectedCoupon(String coupon_code, String coupon_name, String discount, String coupon_qty);

}
