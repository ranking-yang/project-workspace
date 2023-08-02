package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team.webproject.common.IamportAPI;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	IamportAPI imaportAPI;
	
	@PostMapping("/payment/request")
	String getProceedPayment(@SessionAttribute(name = "userId", required = false) String userId,
							Model model, @ModelAttribute TicketDTO ticket,
							@RequestParam("booking_type") String[] bookingTypes,
				            @RequestParam("booking_price") int[] bookingPrices,
				            @RequestParam("booking_qty") int[] bookingQtys,
				            @RequestParam("total_price") int totalPrice) {		
		
		if (userId != null) {
			model.addAttribute("user", paymentService.getSingleUser(userId));
			model.addAttribute("performance", paymentService.getPerformance(ticket.getPerformance_code()));
			model.addAttribute("orders", paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys));
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("api_market", imaportAPI.getImport_api_marketkey());
//			model.addAttribute("api_key", imaportAPI.getImport_api_restkey());			
			
			// 아이디값 시큐리티로 바뀌면 변경하기
			
			return "payment/payment";
			
		} else {
			return "redirect:../login";			
		}
	}
	
	@PostMapping("/payment/success")
	String paymentSuccess(Model model,
			@SessionAttribute(name = "userId", required = false) String userId,
			@ModelAttribute("TicketDTO") TicketDTO ticket,
			@RequestParam("booking_type") String[] bookingTypes,
            @RequestParam("booking_price") int[] bookingPrices,
            @RequestParam("booking_qty") int[] bookingQtys,
            @ModelAttribute("PaymentDTO") PaymentDTO payment) {
		
		if (userId != null) {
			// 결제 DB 저장 → 예매 테이블에 결제 FK로 갖고 DB에 저장
			List<TicketDTO> tickets = paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys);
			paymentService.UpdateDB(payment, tickets, ticket.getPerformance_code());
			
			// 예매한 티켓, 결제 정보를 DB에서 셀렉해서 가져오는게 좋을듯
			model.addAttribute("tickets", tickets); // 티켓정보
			model.addAttribute("payment", payment); // 결제정보
			                                        // 결제한 performance 정보
			
			return "payment/afterpayment";		
		} else {
			return "redirect:../login";
		}		
		
	}	
	
}
