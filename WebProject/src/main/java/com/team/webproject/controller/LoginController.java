package com.team.webproject.controller;

import java.util.Map;

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
	public String newJoinPOST(@Valid MembersDTO member, Errors errors, Model model
			) throws Exception {
		
		if (errors.hasErrors()) {
            // 회원가입 실패시, 입력 데이터를 유지
            model.addAttribute("memberDto", member);

            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = exService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            System.out.println("회원가입 실패");
            
            return "/join/newJoin";
        }
		
		exService.add(member);
		System.out.println("회원가입 성공");
		
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
