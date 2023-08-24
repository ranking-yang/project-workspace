package com.team.webproject.service;

import org.springframework.http.ResponseEntity;

import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.NaverOauthTokenDTO;
import com.team.webproject.dto.NaverProfileDTO;

public interface OAuthService {

	// 카카오 로그인 관련 로직
	ResponseEntity<String> getKakaoIssueTokenEntity(String code);

	KakaoOauthTokenDTO getKakaoTokenObject(ResponseEntity<String> kakaoIssueTokenEntity);

	ResponseEntity<String> getKakaoMemberInfoEntity(String accessToken);

	KakaoProfileDTO getKakaoProfileObject(ResponseEntity<String> kakaoMemberInfoEntity);

	int saveKakaoMemberIntoDB(KakaoProfileDTO kakaoProfile);

	// 네이버 로그인 관련 로직
	ResponseEntity<String> getNaverIssueTokenEntity(String code, String state);

	NaverOauthTokenDTO getNaverTokenObject(ResponseEntity<String> naverIssueTokenEntity);

	ResponseEntity<String> getNaverMemberInfoEntity(String accessToken);

	NaverProfileDTO getNaverProfileObject(ResponseEntity<String> naverMemberInfoEntity);

	int saveNaverMemberIntoDB(NaverProfileDTO naverProfile);
	
	// 공통 사용부(DB조회 로직)
	MembersDTO getMember(String memberId);
	MembersDTO checkIfMemberExists(String memberId);
	void setOAuth2Authentication(String memberId);
}
