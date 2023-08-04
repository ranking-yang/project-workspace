package com.team.webproject.service;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.MemberCouponDTO;
import com.team.webproject.mapper.CouponMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {

	private final CouponMapper couponMapper;
	
	@Override
	public int saveCouponIntoNewUser() {
		
		int member_code = couponMapper.getMemberCode();
		int coupon_code = 1;
		int coupon_state = 0;
		Calendar expiry_date = Calendar.getInstance();
		expiry_date.add(Calendar.YEAR, 1);
		
		MemberCouponDTO memberCoupon = MemberCouponDTO.builder()
									   .user_code(member_code)
									   .coupon_code(coupon_code)//기본 쿠폰
									   .coupon_state(coupon_state)//미사용
									   .expiry_date(new Date(expiry_date.getTimeInMillis()))
									   .build();
		
		return couponMapper.insertCoupon(memberCoupon);
		
	}

}
