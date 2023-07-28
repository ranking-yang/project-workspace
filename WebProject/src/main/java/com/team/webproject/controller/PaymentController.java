package com.team.webproject.controller;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class PaymentController {
	
	@PostMapping("/payment")
	String getProceedPayment(@RequestBody JSONObject order, Model model) {
		
		System.out.println(order);
		
		model.addAttribute("order", order);
		
		return "/payment/payment";
	}
	
//	@GetMapping("/payment")
//	String go() {return "/payment/payment";}

}
