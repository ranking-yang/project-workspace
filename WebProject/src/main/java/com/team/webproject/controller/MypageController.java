package com.team.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.team.webproject.common.Principal;
import com.team.webproject.dto.EmailRequestDTO;
import com.team.webproject.dto.MembersDTO;

import com.team.webproject.dto.OAuthPropertiesDTO;

import com.team.webproject.dto.ReviewDTO;

import com.team.webproject.service.CouponService;
import com.team.webproject.service.DetailService;
import com.team.webproject.service.EmailService;
import com.team.webproject.service.MypageService;
import com.team.webproject.service.PaymentService;
import com.team.webproject.service.ProductListService;
import com.team.webproject.service.ReviewService;
import com.team.webproject.service.QnAService;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	@Autowired
	ProductListService productListService;
	@Autowired
	CouponService couponService;
	@Autowired
	DetailService detailService;
	@Autowired
	PaymentService performanceService;
	@Autowired
	EmailService emailService;
	@Autowired
	OAuthPropertiesDTO oauth;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QnAService qnaService;

	// 메인 겸 예매내역
	@GetMapping(value = { "", "/all" })
	String gotoMypage(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("tickets", mypageService.getMemberTickets(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "all");
		return "/mypage/mypage-ticket";
	}

	// 예매내역 필터링
	// 사용가능
	@GetMapping("/available")
	String gotoTicketList_available(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("tickets", mypageService.getMemberTickets_available(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "available");
		return "/mypage/mypage-ticket";
	}

	// 사용완료
	@GetMapping("/done")
	String gotoTicketList_done(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("tickets", mypageService.getMemberTickets_done(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "done");
		return "/mypage/mypage-ticket";
	}

	// 최신순
	@GetMapping("/newest")
	String gotoTicketList_newest(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("tickets", mypageService.getMemberTickets(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "newest");
		return "/mypage/mypage-ticket";
	}

	// 오래된순
	@GetMapping("/old")
	String gotoTicketList_old(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("tickets", mypageService.getMemberTickets_old(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("val", "old");
		return "/mypage/mypage-ticket";
	}

	// 티켓 상세페이지
	@PostMapping("/ticket/detail")
	String showTicket(Model model, @RequestParam("payment_code") String payment_code) {
		// 티켓 DTO 실어서 보내주기
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));

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
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("ticket", mypageService.getTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		return "/mypage/mypage-ticket-refund";
	}

	// 환불 요청
	@PostMapping("/ticket/refund/request")
	String refundTicketRequest(Model model, @RequestParam("payment_code") String payment_code) {

		Integer user_code = Principal.getUser().getMember_code();
		String user_id = Principal.getUser().getMember_id();
		// 가져온 결제 코드로 DB 변경

		if (mypageService.refundTicket(user_code, payment_code)) {
			model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
			model.addAttribute("tickets", mypageService.getRefundTickets(user_code));
			model.addAttribute("countWish", productListService.countUserWish_list(user_code));
			return "/mypage/mypage-refund";
		} else {
			model.addAttribute("msg", "이미 환불 처리된 티켓입니다.");
			return "/mypage/mypage-error";
		}
	}

	// 쿠폰
	@GetMapping("/coupon")
	String gotoCouponPage(Model model) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("coupons", couponService.getAllCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));

		return "/mypage/mypage-coupon";
	}

	// 찜목록
	@GetMapping("/wishlist")
	String gotoWishlistPage(Model model) {

		MembersDTO member = Principal.getUser();
		String user_id = member.getMember_id();
		Integer member_code = member.getMember_code();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));

		model.addAttribute("performances", mypageService.getUserWishlist(member_code));
		model.addAttribute("wishlist", productListService.getUserWish_list(member_code));
		model.addAttribute("countWish", productListService.countUserWish_list(member_code));
		model.addAttribute("member_code", member_code);

		return "/mypage/mypage-wishlist";
	}

	// 환불
	@GetMapping("/refund")
	String gotoRefundPage(Model model) {

		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));

		model.addAttribute("tickets", mypageService.getRefundTickets(user_code));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		return "/mypage/mypage-refund";
	}

	@PostMapping("/refund/detail")
	String gotoRefundDetailPage(Model model, @RequestParam("payment_code") String payment_code) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("ticket", mypageService.getRefundTicketDetail(payment_code));
		model.addAttribute("options", mypageService.getTicketOptions(payment_code));
		model.addAttribute("ticketNum", mypageService.getTicketNum(payment_code));
		return "/mypage/mypage-refund-detail";
	}

	// 리뷰 최신순
	@GetMapping(value = { "/review", "/review/DESC" })
	String gotoReviewPage(Model model, String performance_code) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		List<ReviewDTO> reviews = reviewService.reviews(user_code);

		model.addAttribute("reviews", reviews);
		model.addAttribute("val", "DESC");

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));

		return "/mypage/mypage-review";
	}

	// 리뷰 오래된순
	@GetMapping("/review/ASC")
	String gotoReviewPageASC(Model model, String performance_code) {
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();


		List<ReviewDTO> reviewsASC = reviewService.reviewsASC(user_code);

		model.addAttribute("reviews", reviewsASC);
		model.addAttribute("val", "ASC");
		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));

		return "/mypage/mypage-review";
	}
	

	
	// 리뷰 등록
	@PostMapping("/reviews/insert")
	@ResponseBody
	public String insertReview(ReviewDTO review, Model model) {
		
		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();

		// ReviewDTO에 관련된 작업 수행
		reviewService.insertReview(review);
		reviewService.updateTicketReviewCode(reviewService.getReviewCode(user_code), review.getPayment_code());

		model.addAttribute("performance", detailService.getPerformance(review.getPerformance_code())); // DB에서 값 조회
		
		// 업데이트가 성공하면 팝업창을 닫는 스크립트를 반환
		return "<script>window.opener.location.reload(); window.close();</script>";
	}
	
	// 리뷰 삭제
	@PostMapping("/review/delete")
	String deleteReview(Model model, Integer review_code, String performance_code) {

		reviewService.deleteReview(review_code);

		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		List<ReviewDTO> reviews = reviewService.reviews(user_code);

		model.addAttribute("reviews", reviews);
		model.addAttribute("val", "DESC");
		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));

		return "/mypage/mypage-review";
	}

	// 나의 QnA
	@GetMapping("/qna")
	String gotoQnAPage(Model model) {

		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();
		
		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("userQna", qnaService.getUserQnAs(user_code));
		return "/mypage/mypage-qna";
	}

	// 나의 정보 수정
	@PostMapping("/info")
	String gotoQInfoPage(Model model, String member_id, String member_pwd, HttpServletRequest req,
			HttpServletResponse resp) {

		MembersDTO member = Principal.getUser();
		Integer user_code = member.getMember_code();
		String user_id = member.getMember_id();

		model.addAttribute("member", member);
		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(user_id));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));

		if (member.getMember_id().startsWith("naver_") || member.getMember_id().startsWith("kakao_")) {
			member_id = member.getMember_id();
			member_pwd = oauth.getPassword();
		}

		if (mypageService.hasCookie(member_id, req)) {
			return "/mypage/mypage-info";
		} else if (mypageService.checkPassword(member_id, member_pwd)) {

			mypageService.setVerifiedCookie(member_id, resp);

			return "/mypage/mypage-info";
		} else {
			return "redirect:/mypage/check-before-change";
		}

	}

	@GetMapping("/check-before-change")
	public String checkBeforChange(Model model, HttpServletRequest req) {

		MembersDTO member = Principal.getUser();
		String memberId = member.getMember_id();
		Integer user_code = member.getMember_code();

		model.addAttribute("couponCount", couponService.getTheNumberOfCoupon(memberId));
		model.addAttribute("countWish", productListService.countUserWish_list(user_code));
		model.addAttribute("member", member);

		if (memberId.startsWith("naver_") || memberId.startsWith("kakao_")) {
			return "/mypage/mypage-info";
		} else {
			return mypageService.hasCookie(memberId, req) ? "/mypage/mypage-info" : "/mypage/check-pwd";
		}

	}

	@PostMapping("/rest/verify-code")
	@ResponseBody
	public ResponseEntity<String> verifyCode(@RequestBody EmailRequestDTO emailReq) {

		return ResponseEntity.ok(emailService.sendCodeToEmail(emailReq.getEmail()));
	}

	@PostMapping("/rest/verify-retry")
	@ResponseBody
	public ResponseEntity<String> verifyCheck(@RequestBody EmailRequestDTO emailReq) {

		return ResponseEntity.ok(emailService.sendCodeToEmail(emailReq.getEmail()));
	}

	@GetMapping("/verify-email")
	public String verifyEmail() {

		return "/mypage/email-verify-popup";
	}

	@PostMapping("/modify")
	public String modify(MembersDTO member) {
		
		System.out.println("정보수정용: " + member);
		
		mypageService.modifyMemberInfo(member);
		
		return "redirect:/mypage";
	}

	// 리뷰 작성 팝업창
	@RequestMapping("/reviewWriting")
	void goToReviewWriting(Model model, String performance_code, String payment_code) {
		model.addAttribute("performance_code", performance_code); // DB에서 값 조회
		model.addAttribute("payment_code", payment_code); // DB에서 값 조회
	}

	// 리뷰 수정 팝업창
	@RequestMapping("/reviewUpdate")
	String goToReviewUpdate(@RequestParam Integer review_code, Model model) {
		System.out.println("goToReviewUpdate 실행");
		ReviewDTO review = reviewService.getReviewByCode(review_code);
		model.addAttribute("review", review);
		System.out.println(review.toString());
		return "/mypage/reviewUpdate";
	}

	@PostMapping("/review/update")
	@ResponseBody
	String updateReview(ReviewDTO review) {
		System.out.println("updateReview 실행");
		System.out.println(review.toString());
		reviewService.updateReview(review);

		// 업데이트가 성공하면 팝업창을 닫는 스크립트를 반환
		return "<script>window.opener.location.reload(); window.close();</script>";
	}
}