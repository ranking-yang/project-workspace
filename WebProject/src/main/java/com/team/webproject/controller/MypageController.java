package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MypageController {
	
	@GetMapping("/mypage")
	String main() {
		return "/mypage/MyPageMain";
	}
}