package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("/mypage")
	String main(Model model, String className) {
		
		model.addAttribute("className", className);
		
		return "/mypage/mypage";
	}
	
	
	
}