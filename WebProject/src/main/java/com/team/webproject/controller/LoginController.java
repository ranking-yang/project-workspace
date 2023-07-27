package com.team.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MessageDTO;
import com.team.webproject.dto.SmsResponseDTO;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.SmsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	private final LoginService exService;
	
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
	
	
	private final SmsService smsService;

    @RequestMapping(value="/sms/send", method=RequestMethod.POST)
    @ResponseBody
    public SmsResponseDTO sendSms(@RequestParam("to") String to) throws UnsupportedEncodingException, URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
        MessageDTO messageDto = new MessageDTO();
        System.out.println(to);
        messageDto.setTo(to);
    	SmsResponseDTO responseDto = smsService.sendSms(messageDto);
        return responseDto;
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
