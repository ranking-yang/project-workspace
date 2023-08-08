package com.team.webproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.service.CouponService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {

	private final CouponService couponService;
	
	@GetMapping(value = { "/", "" })
	String main(Model model, HttpServletRequest request) {
		
		// 전체 securityholder 내용
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("main logout check:"+ SecurityContextHolder.getContext());
		System.out.println("main principal : " + principal.toString());
		
		// 권한이 anonymousUser 이면 
		if (principal.equals("anonymousUser")) {
			model.addAttribute("userId", null);
			return "main/main";
		}
		String username = null;
		// 권한이 User 이면
		if (SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().equals("[ROLE_member]")) {
			username = ((UserDetails) principal).getUsername();
			System.out.println("main username : " + username);
			model.addAttribute("userId", username);
			if(!couponService.checkIfBirthDayCouponExists(username)) {
				couponService.giveBirthDayCoupon(username);
			}
			return "main/main";
		// 권한이 admin 이면
		} else {
			username = ((UserDetails) principal).getUsername();
			System.out.println("main username : " + username);
			model.addAttribute("userId", username);
			return "admin/api";
		}
		
	}

}
