package com.team.webproject.dto;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Getter;

@PropertySource("classpath:/protected/oauth.properties")
@Getter
@Component
public class OAuthPropertiesDTO {
	
	// 카카오 인증 요청
	@Value("${oauth.kakao.authorization-uri}")
	String kakaoAuthorizationUri;
	@Value("${oauth.kakao.redirect-uri}")
	String kakaoRedirectUri;
	@Value("${oauth.kakao.token-uri}")
	String kakaoTokenUri;
	@Value("${oauth.kakao.user-uri}")
	String kakaoUserUri;
	@Value("${oauth.kakao.logout-uri}")
	String kakaoLogoutUri;
	@Value("${oauth.kakao.logout-redirect-uri}")
	String kakaoLogoutRedirectUri;
	
	@Value("${oauth.kakao.client-id}")
	String kakaoClientId;
	@Value("${oauth.kakao.authorization}")
	String kakaoAuthorization;
	
	@Value("${oauth.kakao.response-type}")
	String kakaoResponseType;
	@Value("${oauth.kakao.content-type}")
	String kakaoContentType;
	@Value("${oauth.kakao.grant-type}")
	String kakaoGrantType;
	
	
	// 네이버 인증 요청
	@Value("${oauth.naver.authorization-uri}")
	String naverAuthorizationUri;
	@Value("${oauth.naver.redirect-uri}")
	String naverRedirectUri;
	@Value("${oauth.naver.token-uri}")
	String naverTokenUri;
	@Value("${oauth.naver.user-uri}")
	String naverUserUri;
	
	@Value("${oauth.naver.client-id}")
	String naverClientId;
	@Value("${oauth.naver.client-secret}")
	String naverClientSecret;
	@Value("${oauth.naver.authorization}")
	String naverAuthorization;
	@Value("${oauth.naver.state}")
	String naverState;
	
	@Value("${oauth.naver.response-type}")
	String naverResponseType;
	@Value("${oauth.naver.grant-type}")
	String naverGrantType;
	
	// 네이버, 카카오 비밀번호
	@Value("${oauth.common.password}")
	String password;
	
	
	public StringBuilder getInfo() {
		return new StringBuilder();
	}
}
