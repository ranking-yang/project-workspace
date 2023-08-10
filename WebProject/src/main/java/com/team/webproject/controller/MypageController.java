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

import com.team.webproject.service.CouponService;
import com.team.webproject.service.MypageService;
import com.team.webproject.service.ProductListService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	@Autowired
	ProductListService productListService;
	
	
	@Autowired
	CouponService couponService;
	
	// 메인 겸 예매내역
	@GetMapping("")
	String gotoMypage(Model model) {		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();
		model.addAttribute("tickets", mypageService.getMemberTickets(userID));
		model.addAttribute("countWish", productListService.countUserWish_list(productListService.getMember_code(userID)));
		return "/mypage/mypage-ticket";
	}
	
	// 티켓 상세페이지
	@PostMapping("/ticket/detail")
	String showTicket(Model model, @RequestParam("payment_code") String payment_code) {		
		// 티켓 DTO 실어서 보내주기
		model.addAttribute("ticket", mypageService.getTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));		
		return "/mypage/mypage-ticket-detail";
	}
	
	// 환불 상세페이지
	@PostMapping("/ticket/refund")
	String refundTicket(Model model, @RequestParam("payment_code") String payment_code) {
		// 환불 DTO 실어서 보내주기
		model.addAttribute("ticket", mypageService.getTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));		
		return "/mypage/mypage-ticket-refund";
	}
	
	// 환불 요청
	@PostMapping("/ticket/refund/request")
	String refundTicketRequest(Model model, @RequestParam("payment_code") String payment_code) {
		// 가져온 결제 코드로 DB 변경		
		if (mypageService.refundTicket(payment_code)) {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String userID = ((UserDetails) principal).getUsername();
			
			model.addAttribute("tickets", mypageService.getRefundTickets(userID));
			
			return "/mypage/mypage-refund";
		} else {
			return "redirect:/mypage";
		}		
	}
	
	
	// 쿠폰
	@GetMapping("/coupon")
	String gotoCouponPage(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();
		
		model.addAttribute("coupons", couponService.getAllCoupon(userID));
		
		return "/mypage/mypage-coupon";
	}
	
	// 찜목록
	@GetMapping("/wishlist")
	String gotoWishlistPage(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();
		
		int member_code = productListService.getMember_code(userID);
		
		model.addAttribute("performances", mypageService.getUserWishlist(member_code));
		model.addAttribute("wishlist", productListService.getUserWish_list(member_code));
		model.addAttribute("countWish", productListService.countUserWish_list(member_code));
		model.addAttribute("member_code", member_code);

		return "/mypage/mypage-wishlist";
	}
	
	// 환불
	@GetMapping("/refund")
	String gotoRefundPage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userID = ((UserDetails) principal).getUsername();		
		model.addAttribute("tickets", mypageService.getRefundTickets(userID));		
		return "/mypage/mypage-refund";
	}
	
	@PostMapping("/refund/detail")
	String gotoRefundDetailPage(Model model, @RequestParam("payment_code") String payment_code) {		
		model.addAttribute("ticket", mypageService.getRefundTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));				
		return "/mypage/mypage-refund-detail";
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