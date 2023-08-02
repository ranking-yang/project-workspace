package com.team.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MessageDTO;
import com.team.webproject.dto.SmsResponseDTO;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.SmsService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class LoginController {
	
	private final LoginService loginService;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String loginGET(Model model) {
        model.addAttribute("loginRequest", new MembersDTO());
        
		return "login/login";
	}
	
	// 회원가입 성공 후 로그인 페이지로
		@PostMapping("/login")
		public String loginPOST(@ModelAttribute MembersDTO member, HttpServletRequest httpServletRequest, Model model) {
	        
	        httpServletRequest.getSession().invalidate();
	        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
	        
			if (loginService.login(member, httpServletRequest)) {
				// 세션에 userId를 넣어줌
				session.setAttribute("userId", member.getMember_id());
				return "redirect:/main";
			} else {
				return "redirect:/login";
			}
		}
	// 로그아웃
	@GetMapping("/logout")
	public String logoutGET(HttpServletRequest httpServletRequest) {
		
		httpServletRequest.getSession().invalidate();
		return "redirect:/login";
	}	
//	// 타임티켓/간편 회원가입 선택 페이지
//	@GetMapping("/join")
//	public String joinGET() {
//		System.out.println("2번");
//		return "join/newJoin";
//	}
	
	// 타임티켓 회원가입 페이지로
	@GetMapping("/user/newJoin")
	public String newJoinGET(MembersDTO member) {
		return "join/newJoin";
	}
	
	// 회원가입
	@PostMapping("/user/newJoin")
	public String newJoinPOST(@Valid MembersDTO member, Errors errors, Model model, String member_pwd_verify){
//		, String member_pwd_verify
//		return "/newJoin";
		System.out.println(member.getMember_id());
		System.out.println(member.getMember_phone());
		if (errors.hasErrors()) {
			// 회원가입 실패시 입력 데이터 값을 유지
			model.addAttribute("member", member);
			// 비밀번호 재확인
			if (!member.getMember_pwd().equals(member_pwd_verify)) {
				model.addAttribute("pwd_check", " 비밀번호가 일치하지 않습니다.");
			}else if(member_pwd_verify.equals("")) {
				model.addAttribute("pwd_check", " 비밀번호를 다시 한번 입력해주세요.");
			}
			
			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = loginService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				System.out.println(key);
				System.out.println(validatorResult.get(key));
				model.addAttribute(key, validatorResult.get(key));
			}
			return "join/newJoin";
		} else {

//			exService.checkId(member, member_pwd_verify);
//			return exService.checkId(member, member_pwd_verify);
			loginService.add(member);

			return "redirect:/login";
		}
	}

	@RequestMapping(value="/join/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public String checkid(@RequestParam("id") String id) {
		System.out.println("id:"+id);
		System.out.println(loginService.checkId(id));
		if (loginService.checkId(id) == 0) {
			return "사용가능한 id 입니다.";
		}else {
			System.out.println("있음.");
			return "중복되는 id 입니다.";
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

