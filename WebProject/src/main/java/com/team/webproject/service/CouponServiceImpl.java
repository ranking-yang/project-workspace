package com.team.webproject.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.common.Coupon;
import com.team.webproject.dto.CouponDTO;
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

		MemberCouponDTO memberCoupon = MemberCouponDTO.builder().user_code(member_code).coupon_code(Coupon.NEW_JOIN)// 기본
																													// 쿠폰
				.coupon_state(Coupon.NOT_USED)// 미사용
				.expiry_date(new Date(expiry_date.getTimeInMillis())).build();

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
		if (couponMapper.checkBirthday(user_id) == 1) {
			int member_code = couponMapper.getMemberCodeWithUserId(user_id);
			Calendar expiry_date = Calendar.getInstance();
			int lastDate = expiry_date.getActualMaximum(Calendar.DATE);
			expiry_date.set(expiry_date.get(Calendar.YEAR), expiry_date.get(Calendar.MONTH), lastDate);

			MemberCouponDTO memberCoupon = MemberCouponDTO.builder().user_code(member_code).coupon_code(Coupon.BIRTHDAY)// 기본
																														// 쿠폰
					.coupon_state(Coupon.NOT_USED)// 미사용
					.expiry_date(new Date(expiry_date.getTimeInMillis())).build();

			return couponMapper.insertCoupon(memberCoupon);
		}
		return 0;
	}

	@Override
	public List<CouponDTO> getAllCouponList() {
		return couponMapper.getAllCoupon();
	}

	@Override
	public int addNewCoupon(String coupon_name, String coupon_qty, String discount) {

		CouponDTO coupon = new CouponDTO();

		coupon.setCoupon_name(coupon_name);

		if (coupon_qty.equals("제한없음")) {
			coupon.setCoupon_qty(null);
		} else {
			coupon.setCoupon_qty(Integer.parseInt(coupon_qty));
		}

		if (discount.endsWith("%")) {
			int lastIndex = discount.indexOf('%');
			double discount_rate = Double.parseDouble(discount.substring(0, lastIndex)) / 100;
			coupon.setDiscount_rate(discount_rate);
		} else {
			int lastIndex = discount.indexOf('원');
			if (lastIndex != -1) {
				int discount_money = Integer.parseInt(discount.substring(0, lastIndex));
				coupon.setDiscount_money(discount_money);
			} else {
				int discount_money = Integer.parseInt(discount);
				coupon.setDiscount_money(discount_money);
			}
		}

		return couponMapper.insertNewCoupon(coupon);
	}

	@Override
	public CouponDTO getNewestCoupon() {
		return couponMapper.getNewestCoupon();
	}

	@Override
	public int deleteSelectedCoupon(String coupon_code) {
		int code = Integer.parseInt(coupon_code);
		return couponMapper.deleteCoupon(code);
	}

	@Override
	public int updateSelectedCoupon(String coupon_code, String coupon_name, String discount, String coupon_qty) {

		CouponDTO coupon = new CouponDTO();
		
		coupon.setCoupon_code(Integer.parseInt(coupon_code));
		coupon.setCoupon_name(coupon_name);

		if (coupon_qty.equals("제한없음")) {
			coupon.setCoupon_qty(null);
		} else {
			coupon.setCoupon_qty(Integer.parseInt(coupon_qty));
		}

		if (discount.endsWith("%")) {
			int lastIndex = discount.indexOf('%');
			double discount_rate = Double.parseDouble(discount.substring(0, lastIndex)) / 100;
			coupon.setDiscount_rate(discount_rate);
		} else {
			int lastIndex = discount.indexOf('원');
			if (lastIndex != -1) {
				int discount_money = Integer.parseInt(discount.substring(0, lastIndex));
				coupon.setDiscount_money(discount_money);
			} else {
				int discount_money = Integer.parseInt(discount);
				coupon.setDiscount_money(discount_money);
			}
		}

		return couponMapper.updateCoupon(coupon);
	}

}
