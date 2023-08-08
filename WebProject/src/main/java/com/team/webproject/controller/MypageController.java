package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.webproject.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mapageService;
	
	// 메인 겸 예매내역
	@GetMapping("")
	String gotoMypage(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();
		model.addAttribute("tickets", mapageService.getMemberTickets(userID));		
		return "/mypage/mypage-ticket";
	}
	
	@PostMapping("/ticket/detail")
	String showTicket(Model model, @RequestParam("payment_code") String payment_code) {
		
		System.out.println("코드 : " + payment_code);
		
		return "/mypage/mypage-ticket-detail";
	}
	
	// 쿠폰
	@GetMapping("/coupon")
	String gotoCouponPage(Model model) {
		return "/mypage/mypage-coupon";
	}
	
	// 찜목록
	@GetMapping("/wishlist")
	String gotoWishlistPage(Model model) {
		return "/mypage/mypage-wishlist";
	}
	
	// 환불
	@GetMapping("/refund")
	String gotoRefundPage(Model model) {
		return "/mypage/mypage-refund";
	}
	
	// 리뷰
	@GetMapping("/review")
	String gotoReviewPage(Model model) {
		return "/mypage/mypage-review";
	}
	
	// 나의 QnA
	@GetMapping("/qna")
	String gotoQnAPage(Model model) {
		return "/mypage/mypage-qna";
	}
	
	// 나의 정보 수정
	@GetMapping("/info")
	String gotoQInfoPage(Model model) {
		return "/mypage/mypage-info";
	}
}