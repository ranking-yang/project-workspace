package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
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

		// exService.memberJoin(member);

		return "login/login";
	}

	// 타임티켓/간편 회원가입 선택 페이지
	@GetMapping("/join")
	public String joinGET() {

		return "join/join";
	}

	// 타임티켓 회원가입 페이지
	@GetMapping("/new-join")
	public String newJoinGET() {

		return "join/newJoin";
	}

	// 회원가입 후 로그인 페이지로
	@PostMapping("/new-join")
	public String newJoinPOST(MembersDTO login) {

		exService.add(login);

		return "login/login";
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
