package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.webproject.dto.OrderDTO;
import com.team.webproject.service.PaymentServiceImpl;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentServiceImpl paymentService;
	
	@PostMapping("/payment/proceed")
	String getProceedPayment(OrderDTO order, Model model) {
		
		// 아이디값 가져와서 출력해주기 (이거는 시큐리티...)	
		
		model.addAttribute("performance", paymentService.getPerformance(order.getPerformance_code()));
		model.addAttribute("order", order);
		
		return "payment/payment";
	}
	
}
