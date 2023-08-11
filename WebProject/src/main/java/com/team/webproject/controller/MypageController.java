package com.team.webproject.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.team.webproject.common.Principal;
import com.team.webproject.dto.MembersDTO;
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
	@GetMapping(value = {"", "/all"})
	String gotoMypage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Integer user_code = ((MembersDTO) principal).getMember_code();		
		model.addAttribute("tickets", mypageService.getMemberTickets(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "all");
		return "/mypage/mypage-ticket";
	}
	
	// 예매내역 필터링
		// 사용가능
		@GetMapping("/available")
		String gotoTicketList_available(Model model) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer user_code = ((MembersDTO) principal).getMember_code();		
			model.addAttribute("tickets", mypageService.getMemberTickets_available(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));
			model.addAttribute("val", "available");		
			return "/mypage/mypage-ticket";
		}
		// 사용완료
		@GetMapping("/done")
		String gotoTicketList_done(Model model) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer user_code = ((MembersDTO) principal).getMember_code();		
			model.addAttribute("tickets", mypageService.getMemberTickets_done(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));
			model.addAttribute("val", "done");		
			return "/mypage/mypage-ticket";
		}
		// 최신순
		@GetMapping("/newest")
		String gotoTicketList_newest(Model model) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer user_code = ((MembersDTO) principal).getMember_code();		
			model.addAttribute("tickets", mypageService.getMemberTickets(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));
			model.addAttribute("val", "newest");		
			return "/mypage/mypage-ticket";
		}
		// 오래된순
		@GetMapping("/old")
		String gotoTicketList_old(Model model) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer user_code = ((MembersDTO) principal).getMember_code();		
			model.addAttribute("tickets", mypageService.getMemberTickets_old(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));
			model.addAttribute("val", "old");		
			return "/mypage/mypage-ticket";
		}
	
	// 티켓 상세페이지
	@PostMapping("/ticket/detail")
	String showTicket(Model model, @RequestParam("payment_code") String payment_code) {		
		// 티켓 DTO 실어서 보내주기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Integer user_code = ((MembersDTO) principal).getMember_code();
		model.addAttribute("ticket", mypageService.getTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		return "/mypage/mypage-ticket-detail";
	}
	
	// 환불 상세페이지
	@PostMapping("/ticket/refund")
	String refundTicket(Model model, @RequestParam("payment_code") String payment_code) {
		// 환불 DTO 실어서 보내주기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Integer user_code = ((MembersDTO) principal).getMember_code();
		model.addAttribute("ticket", mypageService.getTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));	
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		return "/mypage/mypage-ticket-refund";
	}
	
	// 환불 요청
	@PostMapping("/ticket/refund/request")
	String refundTicketRequest(Model model, @RequestParam("payment_code") String payment_code) {
		// 가져온 결제 코드로 DB 변경		
		if (mypageService.refundTicket(payment_code)) {			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer user_code = ((MembersDTO) principal).getMember_code();			
			model.addAttribute("tickets", mypageService.getRefundTickets(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));			
			return "/mypage/mypage-refund";
		} else {
			return "redirect:/mypage";
		}		
	}
	
	// 공연 종료날짜 조회
	@ResponseBody
	@PostMapping("/checkDate")
	Date chkPerformanceEndDate(@RequestParam("performance_code") String performance_code) {		
		return mypageService.chkEndDate(performance_code);
	}
	
	
	// 쿠폰
	@GetMapping("/coupon")
	String gotoCouponPage(Model model) {
		
		System.out.println(Principal.getUser().getMember_name());
		
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
		Integer user_code = ((MembersDTO) principal).getMember_code();	
		model.addAttribute("tickets", mypageService.getRefundTickets(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		return "/mypage/mypage-refund";
	}
	
	@PostMapping("/refund/detail")
	String gotoRefundDetailPage(Model model, @RequestParam("payment_code") String payment_code) {	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Integer user_code = ((MembersDTO) principal).getMember_code();
		model.addAttribute("ticket", mypageService.getRefundTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));	
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
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