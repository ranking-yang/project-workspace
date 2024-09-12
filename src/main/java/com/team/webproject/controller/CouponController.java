package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.common.Principal;
import com.team.webproject.service.CouponService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/coupon")
@Controller
@RequiredArgsConstructor
public class CouponController {
	
	private final CouponService couponService;
	
	@GetMapping("/popup")
	public String couponPopup(Model model) {
	
		String userName = Principal.getUser().getMember_id();
		
		model.addAttribute("couponList", couponService.getAllCoupon(userName));
		
		return "payment/coupon-popup";
	}
	
}
