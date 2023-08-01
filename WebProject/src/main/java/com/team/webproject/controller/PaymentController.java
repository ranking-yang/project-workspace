package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.OrderDTO;
import com.team.webproject.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;	
	
	@PostMapping("/payment/request")
	String getProceedPayment(Model model, @ModelAttribute OrderDTO order,
							@RequestParam("booking_type") String[] bookingTypes,
				            @RequestParam("booking_price") int[] bookingPrices,
				            @RequestParam("booking_qty") int[] bookingQtys,
				            @RequestParam("total_price") int totalPrice) {		
		
		model.addAttribute("performance", paymentService.getPerformance(order.getPerformance_code()));
		model.addAttribute("orders", paymentService.getOrders(order, bookingTypes, bookingPrices, bookingQtys));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("api_market", paymentService.getApiMarketkey());
		model.addAttribute("api_key", paymentService.getApiRestkey());
		
		// 아이디값 가져와서 출력해주기 (이거는 시큐리티...)		
		
		return "payment/payment";
	}
	
	@ResponseBody
	@PostMapping("/payment/success")
	String paymentSuccess(@RequestBody List<OrderDTO> orderDTOList) {
		
		System.out.println(orderDTOList.size());
		System.out.println("들어옴");
		
		return "들어옴";
	}
	
	
}
