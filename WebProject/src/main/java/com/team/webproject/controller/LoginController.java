package com.team.webproject.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.service.ExampleService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	private final ExampleService exService;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String loginGET(MembersDTO member) {
		
		return "login/login";
	}

	// 타임티켓/간편 회원가입 선택 페이지
	@GetMapping("/join")
	public String joinGET() {
		
		return "join/join";
	}
	
	// 타임티켓 회원가입 페이지로
	@GetMapping("/new-join")
	public String newJoinGET() {
		
		return "join/newJoin";
	}
	
	// 회원가입
	@PostMapping("/new-join")
	public String newJoinPOST(@Valid MembersDTO member, Errors errors, Model model
			, String member_pwd_verify) throws Exception {
		
		if (errors.hasErrors()) {
			System.out.println("회원가입 실패");
			return "/join/newJoin";
		} else {
			return exService.checkId(member, member_pwd_verify);
		}
	}
	
	// 회원가입 성공 후 로그인 페이지로
	@PostMapping("/login")
	public String loginPOST(MembersDTO member, HttpServletResponse response) {
		
		if (exService.login(member, response)) {
			return "login/successLogin";
		} else {
			return "redirect:/login";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutGET(HttpServletResponse response) {
		
		exService.logout(response);
		
		return "redirect:/login";
	}

	// 아이디 찾기 페이지
	@GetMapping("/findId")
	public String findIdGET() {
		
		return "join/findId";
	}

	// 비밀번호 찾기 페이지
	@GetMapping("/findPassword")
	public String findPasswordGET() {
		
		return "join/findPassword";
	}
	
}
