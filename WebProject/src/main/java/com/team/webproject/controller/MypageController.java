package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.dto.TicketsListDTO;
import com.team.webproject.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mapageService;
	
	// 메인 겸 예매내역
	@GetMapping("/mypage")
	String gotoMypage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();
		
		List<TicketsListDTO> tickets = mapageService.getMemberTickets(userID);
//		System.out.println(tickets);
		
		model.addAttribute("tickets", tickets);
		
		return "/mypage/mypage-ticket";
	}
	
	// 쿠폰
	@GetMapping("/mypage/coupon")
	String gotoCouponPage(Model model) {
		return "/mypage/mypage-coupon";
	}
	
	// 찜목록
	@GetMapping("/mypage/wishlist")
	String gotoWishlistPage(Model model) {
		return "/mypage/mypage-wishlist";
	}
	
	// 환불
	@GetMapping("/mypage/refund")
	String gotoRefundPage(Model model) {
		return "/mypage/mypage-refund";
	}
	
	// 리뷰
	@GetMapping("/mypage/review")
	String gotoReviewPage(Model model) {
		return "/mypage/mypage-review";
	}
	
	// 나의 QnA
	@GetMapping("/mypage/qna")
	String gotoQnAPage(Model model) {
		return "/mypage/mypage-qna";
	}
	
	// 나의 정보 수정
	@GetMapping("/mypage/info")
	String gotoQInfoPage(Model model) {
		return "/mypage/mypage-info";
	}
}