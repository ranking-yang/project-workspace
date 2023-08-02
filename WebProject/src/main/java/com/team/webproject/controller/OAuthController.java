package com.team.webproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.NaverOauthTokenDTO;
import com.team.webproject.dto.NaverProfileDTO;
import com.team.webproject.dto.OAuthPropertiesDTO;
import com.team.webproject.service.OAuthService;

import lombok.RequiredArgsConstructor;


@RequestMapping("/auth")
@RequiredArgsConstructor
@Controller
public class OAuthController {

	private final OAuthService oauthService;
	private final OAuthPropertiesDTO oauthProperties;
	
	// 카카오 로그인 요청
	@GetMapping("/kakao/login")
	public String kakaoLogin() {
		return oauthProperties.getInfo()
				.append("redirect:")
				.append(oauthProperties.getKakaoAuthorizationUri())
				.append("?response_type=")
				.append(oauthProperties.getKakaoResponseType())
				.append("&client_id=")
				.append(oauthProperties.getKakaoClientId())
				.append("&redirect_uri=")
				.append(oauthProperties.getKakaoRedirectUri()).toString();
	}
	
	// 네이버 로그인 요청
	@GetMapping("/naver/login")
	public String naverLogin() {
		return oauthProperties.getInfo()
				.append("redirect:")
				.append(oauthProperties.getNaverAuthorizationUri())
				.append("?response_type=")
				.append(oauthProperties.getNaverResponseType())
				.append("&client_id=")
				.append(oauthProperties.getNaverClientId())
				.append("&state=")
				.append(oauthProperties.getNaverState())
				.append("&redirect_uri=")
				.append(oauthProperties.getNaverRedirectUri()).toString();
	}
	
	// 카카오 로그인 CallBack(인증과정)
	@GetMapping("/kakao/callback")
	public String kakaoCallback(String code, HttpServletRequest req) {
		
		ResponseEntity<String> kakaoTokenResponse = oauthService.getKakaoIssueTokenEntity(code);
		KakaoOauthTokenDTO oauthToken = oauthService.getKakaoTokenObject(kakaoTokenResponse);
		
		ResponseEntity<String> memberInfoResponse = oauthService.getKakaoMemberInfoEntity(oauthToken.getAccess_token());
		KakaoProfileDTO kakaoProfile = oauthService.getKakaoProfileObject(memberInfoResponse);

		MembersDTO member = oauthService.checkIfMemberExists("kakao_"+kakaoProfile.getId());

		if (member == null) {
			if(oauthService.saveKakaoMemberIntoDB(kakaoProfile) == 1) {
				oauthService.getSessionIncludingMemberId(req, "kakao_"+kakaoProfile.getId());
				return "/login/successLogin";
			} 
			return "/login/login";
		} else {
			
			oauthService.getSessionIncludingMemberId(req, member.getMember_id());
			
			return "redirect:/main";
		}
	}

	// 네이버 로그인 CallBack(인증과정)
	@GetMapping("/naver/callback")
	public String naverCallback(String code, String state, HttpServletRequest req) {

		ResponseEntity<String> naverTokenResponse = oauthService.getNaverIssueTokenEntity(code, state);
		NaverOauthTokenDTO oauthToken = oauthService.getNaverTokenObject(naverTokenResponse);

		ResponseEntity<String> memberInfoResponse = oauthService.getNaverMemberInfoEntity(oauthToken.getAccess_token());
		NaverProfileDTO naverProfile = oauthService.getNaverProfileObject(memberInfoResponse);

		MembersDTO member = oauthService.checkIfMemberExists("naver_"+naverProfile.getResponse().getId());

		if (member == null) {
			if(oauthService.saveNaverMemberIntoDB(naverProfile) == 1) {
				oauthService.getSessionIncludingMemberId(req, "naver_"+naverProfile.getResponse().getId());
				return "/login/successLogin";
			} 
			return "/login/login";
		} else {
			
			oauthService.getSessionIncludingMemberId(req, member.getMember_id());
			
			return "redirect:/main";
		}
		
	}
	
	// 아직 구현 중
	@GetMapping("/test/logout")
	@ResponseBody
	public String oauthLogout() {
		RestTemplate rt = new RestTemplate();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("client_id", "d7a60e4c5295cff647529128c70b7348");
		params.add("logout_redirect_uri", "http://localhost:8090/login");
		
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, new HttpHeaders());
		
		return rt.exchange("https://kauth.kakao.com/oauth/logout",
							HttpMethod.GET,
							httpEntity, 
							String.class).getBody();
	}
	
	
	@GetMapping("/test")
	@ResponseBody
	public String session(HttpServletRequest req) {
		return (String) req.getSession().getAttribute("member_id");
	}
	
	
}
