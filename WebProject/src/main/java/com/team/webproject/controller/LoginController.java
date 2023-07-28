package com.team.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
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
@Validated
public class LoginController {
	
	private final LoginService exService;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String loginGET(MembersDTO member) {
		System.out.println("1번");
		return "login/login";
	}

//	// 타임티켓/간편 회원가입 선택 페이지
//	@GetMapping("/join")
//	public String joinGET() {
//		System.out.println("2번");
//		return "join/newJoin";
//	}
	
	// 타임티켓 회원가입 페이지로
	@GetMapping("/join/newJoin")
	public String newJoinGET(MembersDTO member) {
		System.out.println("3번");
		return "/join/newJoin";
	}
	
	// 회원가입
	@PostMapping("/join/newJoin")
	public String newJoinPOST(@Valid MembersDTO member, Errors errors, Model model) throws Exception{
//		, String member_pwd_verify
		System.out.println("4번");
		System.out.println(errors.hasErrors());
//		return "/newJoin";
		if (errors.hasErrors()) {
			// 회원가입 실패시 입력 데이터 값을 유지
			model.addAttribute("memberDto", member);
			
			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = exService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "/newJoin";
		} else {
//			return exService.checkId(member, member_pwd_verify);
			return "redirect:/login";
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
    
    @RequestMapping(value="/sms/test", method=RequestMethod.POST)
    @ResponseBody
    public SmsResponseDTO sendtest(@RequestParam("to") String to) throws UnsupportedEncodingException, URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
//        MessageDTO messageDto = new MessageDTO();
//        System.out.println(to);
//        messageDto.setTo(to);
    	SmsResponseDTO responseDto = new SmsResponseDTO();
    	responseDto.setSmsConfirmNum("1234");
    	
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
