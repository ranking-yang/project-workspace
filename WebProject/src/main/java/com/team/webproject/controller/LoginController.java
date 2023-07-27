package com.team.webproject.controller;

import java.sql.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TestUserDTO;
import com.team.webproject.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	private final LoginService loginService;
	
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
			return loginService.checkId(member, member_pwd_verify);
		}
	}
	
	// 회원가입 성공 후 로그인 페이지로
	@PostMapping("/login")
	public String loginPOST(MembersDTO member, HttpServletResponse response) {
		
		if (loginService.login(member, response)) {
			return "login/successLogin";
		} else {
			return "redirect:/login";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutGET(HttpServletResponse response) {
		
		loginService.logout(response);
		
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
	
	// 카카오 로그인 CallBack(인증과정)
	@GetMapping("/auth/kakao/callback")
	//@ResponseBody
	public String kakaoCallback(String code) {
		ResponseEntity<String> tokenResponse = loginService.getKakaoIssueTokenEntity(code);
		
		KakaoOauthTokenDTO oauthToken = loginService.getKakaoTokenObject(tokenResponse);
				
		ResponseEntity<String> memberInfoResponse = loginService.getKakaoMemberInfoEntity(oauthToken.getAccess_token());
		
		KakaoProfileDTO kakaoProfile = loginService.getKakaoProfileObject(memberInfoResponse);
		
		// 이메일 대신 아이디를 활용하는 것도 괜찮을 것 같다
		TestUserDTO member = loginService.checkIfMemberExists(kakaoProfile.getKakao_account().getEmail());
		// 기존 가입자인지 확인
		// 맞으면 쿠키에 담아서 로그인 성공창으로
		// 신규면 회원가입 후에 쿠키에 담아서 로그인 성공창으로 넘긴다
		if (member == null) {
			loginService.saveKakaoMemberIntoDb(kakaoProfile);
			// 쿠키에 담는 로직이 필요함
			// loginService.login로직 참조
			return "login/successLogin";
		} else {
			// 검사를 했기 때문에 바로 성공창으로 보낸다
		}
		
		return memberInfoResponse.getBody();
	}
	
}
