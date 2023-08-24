package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.CouponDTO;
import com.team.webproject.dto.MemberCouponDTO;

public interface CouponMapper {
	
	int getMemberCode();
	
	int getMemberCodeWithUserId(@Param("user_id") String user_id);
	
	int insertCoupon(MemberCouponDTO memberCoupon);
	
	List<MemberCouponDTO> getAllRecords(@Param("user_id") String user_id);
	
	int getCount(@Param("user_id") String user_id);
	
	int getBirthdayCoupon(@Param("user_id") String user_id);
	
	int checkBirthday(@Param("user_id") String user_id);
	
	int updateCouponState(@Param("member_coupon_code") int memberCouponCode);
	
	int updateCouponReturn(int member_code, String payment_code);
	
	List<CouponDTO> getAllCoupon();
	
	int insertNewCoupon(CouponDTO coupon);
	
	CouponDTO getNewestCoupon();
	
	int deleteCoupon(@Param("coupon_code") int code);
	
	int updateCoupon(CouponDTO coupon);
}
