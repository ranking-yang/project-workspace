
package com.team.webproject.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.Naver_Sens_V2;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	private final LoginService exService;
	
	public String sendRandomMessage(String tel) {
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(tel, numStr);

	    return numStr;
	}
	
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
	public String newJoinPOST(MembersDTO member, Errors errors, Model model
			, String member_pwd_verify) throws Exception {
		
		if (errors.hasErrors()) {
			System.out.println("회원가입 실패");
			return "/join/newJoin";
		}else {
			return null;
		}
		 
//		} else {
//			return exService.checkId(member, member_pwd_verify);
//		}
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
	
	@RequestMapping(value="/phoneAuth", method= RequestMethod.POST)
	@ResponseBody
	public Boolean phoneAuth(String tel, HttpServletRequest request) {
				
//	    try { // 이미 가입된 전화번호가 있으면
//	        if(memberService.memberTelCount(tel) > 0) 
//	            return true; 
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
		HttpSession session = request.getSession();
	    String code = sendRandomMessage(tel);
	    session.setAttribute("rand", code);
	    
	    return false;
	}

	@RequestMapping(value="/phoneAuthOK", method= RequestMethod.POST)
	@ResponseBody
	public Boolean phoneAuthOk(String inputcode, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String rand = (String) session.getAttribute("rand");

	    System.out.println(rand + " : " + inputcode);

	    if (rand.equals(inputcode)) {
	        session.removeAttribute("rand");
	        return false;
	    } 

	    return true;
	}
}