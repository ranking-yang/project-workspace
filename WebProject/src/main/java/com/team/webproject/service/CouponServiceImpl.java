package com.team.webproject.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.common.Coupon;
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
		Calendar expiry_date = Calendar.getInstance();
		expiry_date.add(Calendar.YEAR, 1);
		
		MemberCouponDTO memberCoupon
			= MemberCouponDTO.builder()
				   .user_code(member_code)
				   .coupon_code(Coupon.NEW_JOIN)//기본 쿠폰
				   .coupon_state(Coupon.NOT_USED)//미사용
				   .expiry_date(new Date(expiry_date.getTimeInMillis()))
				   .build();
		
		return couponMapper.insertCoupon(memberCoupon);
		
	}

	@Override
	public List<MemberCouponDTO> getAllCoupon(String user_id) {
		return couponMapper.getAllRecords(user_id);
	}

	@Override
	public int getTheNumberOfCoupon(String user_id) {
		return couponMapper.getCount(user_id);
	}

	@Override
	public boolean checkIfBirthDayCouponExists(String user_id) {
		if (couponMapper.getBirthdayCoupon(user_id) != 0) {
			return true;
		}	
		return false;
	}

	@Override
	public int giveBirthDayCoupon(String user_id) {
		if(couponMapper.checkBirthday(user_id) == 1) {
			int member_code = couponMapper.getMemberCodeWithUserId(user_id);
			Calendar expiry_date = Calendar.getInstance();
			int lastDate = expiry_date.getActualMaximum(Calendar.DATE);
			expiry_date.set(expiry_date.get(Calendar.YEAR),
							expiry_date.get(Calendar.MONTH),
							lastDate);
			
			
			MemberCouponDTO memberCoupon
				= MemberCouponDTO.builder()
					   .user_code(member_code)
					   .coupon_code(Coupon.BIRTHDAY)//기본 쿠폰
					   .coupon_state(Coupon.NOT_USED)//미사용
					   .expiry_date(new Date(expiry_date.getTimeInMillis()))
					   .build();
			
			
			return couponMapper.insertCoupon(memberCoupon);
		}
		return 0;
	}

}
