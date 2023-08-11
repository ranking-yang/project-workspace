package com.team.webproject.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.service.CouponService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/coupon")
@Controller
@RequiredArgsConstructor
public class CouponController {
	
	private final CouponService couponService;
	
	@GetMapping("/popup")
	public String couponPopup(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String userName = ((UserDetails) principal).getUsername();
		//System.out.println(couponService.getAllCoupon(userName));
		
		model.addAttribute("couponList", couponService.getAllCoupon(userName));
		
		return "payment/coupon-popup";
	}
	
}
