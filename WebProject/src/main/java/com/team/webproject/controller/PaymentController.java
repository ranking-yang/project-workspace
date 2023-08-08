package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.webproject.common.IamportAPI;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.service.CouponService;
import com.team.webproject.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	IamportAPI imaportAPI;
	
	//쿠폰 보유장수 표기관련 로직
	@Autowired
	CouponService couponService;
	
	@PostMapping("/payment/request")
	String getProceedPayment(Model model,
			@ModelAttribute TicketDTO ticket,
			@RequestParam("booking_type") String[] bookingTypes,
			@RequestParam("booking_price") int[] bookingPrices,
			@RequestParam("booking_qty") int[] bookingQtys,
			@RequestParam("total_price") int totalPrice) {
		
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // holder 불러오기
		
		if (principal.equals("anonymousUser")) {			
			return "redirect:../login";
		} else {			
			String userID = ((UserDetails) principal).getUsername();
			model.addAttribute("user", paymentService.getSingleUser(userID));
			model.addAttribute("performance", paymentService.getPerformance(ticket.getPerformance_code()));
			model.addAttribute("orders", paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys));
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("api_market", imaportAPI.getImport_api_marketkey());
			
			// 해당 유저 쿠폰 보유장수 파악
			model.addAttribute("coupon_count", couponService.getTheNumberOfCoupon(userID));
			
			return "payment/payment";
		}

	}

	@PostMapping("/payment/success")
	String paymentSuccess(Model model,
			@ModelAttribute("TicketDTO") TicketDTO ticket,
			@RequestParam("booking_type") String[] bookingTypes,
			@RequestParam("booking_price") int[] bookingPrices,
			@RequestParam("booking_qty") int[] bookingQtys,
			@ModelAttribute("PaymentDTO") PaymentDTO payment) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // holder 불러오기
		String userID = ((UserDetails) principal).getUsername();

		if (userID != null) {
			// 결제 DB 저장 → 예매 테이블에 결제 FK로 갖고 DB에 저장
			List<TicketDTO> tickets = paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys);
			paymentService.UpdateDB(payment, tickets, ticket.getPerformance_code());

			// 예매한 티켓, 결제 정보를 실어보내기
			model.addAttribute("tickets", tickets); // 티켓정보
			model.addAttribute("payment", payment); // 결제정보
			model.addAttribute("performance", paymentService.getPerformance(ticket.getPerformance_code()));

			return "payment/afterpayment";		
		} else {
			return null;
		}
		

	}	
	

}
