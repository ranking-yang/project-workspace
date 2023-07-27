package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;

import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TestUserDTO;

public interface LoginService {
	
	// 회원가입 및 로그인 서비스 시작
	String checkId(MembersDTO member, String member_pwd_verify);
	
	boolean login(MembersDTO member, HttpServletResponse response);
	
	void logout(HttpServletResponse response);
	
	int add(MembersDTO login);
	
	public Map<String, String> validateHandling(Errors errors);
	
	List<MembersDTO> getAll();
	// 회원가입 및 로그인 서비스 끝
	
	// 카카오 로그인 관련 로직
	ResponseEntity<String> getKakaoIssueTokenEntity(String code);
	KakaoOauthTokenDTO getKakaoTokenObject(ResponseEntity<String> kakaoIssueTokenEntity);
	ResponseEntity<String> getKakaoMemberInfoEntity(String accessToken);
	KakaoProfileDTO getKakaoProfileObject(ResponseEntity<String> kakaoMemberInfoEntity);
	int saveKakaoMemberIntoDb(KakaoProfileDTO kakaoProfile);
	TestUserDTO checkIfMemberExists(String memberEamil);

}
