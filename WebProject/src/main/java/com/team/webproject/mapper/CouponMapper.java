package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.MemberCouponDTO;

public interface CouponMapper {
	
	int getMemberCode();
	
	int insertCoupon(MemberCouponDTO memberCoupon);
	
	List<MemberCouponDTO> getAllRecords(@Param("user_id") String user_id);
	
	int getCount(@Param("user_id") String user_id);
}
