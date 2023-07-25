package com.team.webproject.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.webproject.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	private final LoginService exService;
	
	// 관리자 페이지
	@GetMapping("/admin")
	public String adminGET() {
		
		return "admin/admin";
	}
	
	@PostMapping("/admin")
	public String adminPOST(
			@Param("id") String id,
			@Param("pwd") String pwd
			) {
		
		System.out.println("id: " + id);
		System.out.println("pwd: " + pwd);
		
		
		return "admin/adminPage";
	}

}
