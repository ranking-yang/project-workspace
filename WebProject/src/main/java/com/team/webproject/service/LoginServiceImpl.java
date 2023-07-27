
package com.team.webproject.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TestUserDTO;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

	private final LoginMapper loginMapper;

	// 회원가입 및 로그인 서비스 시작
	@Override
	public String checkId(MembersDTO member, String member_pwd_verify) {

		if (loginMapper.checkId(member) > 0) {
			System.out.println("아이디 중복, 회원가입 실패");
			return "redirect:/new-Join";
		} else if (member.getMember_pwd().equals(member_pwd_verify)) {
			add(member);
			System.out.println("회원가입 성공");
			return "redirect:/login";
		}
		System.out.println("실패");
		return "redirect:/new-join";
	}

	@Override
	public boolean login(MembersDTO member, HttpServletResponse response) {
		List<MembersDTO> allMembers = loginMapper.getAll();
		for (MembersDTO mem : allMembers) {
			if (member.getMember_id().equals(mem.getMember_id())
					&& member.getMember_pwd().equals(mem.getMember_pwd())) {

				System.out.println("로그인 성공");
				Cookie idCookie = new Cookie("member_id", String.valueOf(member.getMember_id()));
				idCookie.setMaxAge(10);
				response.addCookie(idCookie);
				return true;
			}
		}
		System.out.println("로그인 실패");
		return false;
	}

	@Override
	public void logout(HttpServletResponse response) {

		Cookie idCookie = new Cookie("member_id", null);
		idCookie.setMaxAge(0);
		response.addCookie(idCookie);
		System.out.println("로그아웃");
	}

	@Override
	public int add(MembersDTO login) {

		loginMapper.add(login);
		return 0;
	}

	@Override
	public Map<String, String> validateHandling(Errors errors) {
		Map<String, String> validatorResult = new HashMap<>();

		for (FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}

		return validatorResult;
	}

	@Override
	public List<MembersDTO> getAll() {
		return loginMapper.getAll();
	}
	// 회원가입 및 로그인 서비스 끝

	// 카카오 로그인 관련 로직
	@Override
	public ResponseEntity<String> getKakaoIssueTokenEntity(String code) {
		// 다른 곳으로 데이터 이전하기(보안상 필요 깃허브에 올라가면 안됨)
		String contentType = "application/x-www-form-urlencoded;charset=utf-8";
		String grantType = "authorization_code";
		String clientId = "d7a60e4c5295cff647529128c70b7348";
		String redirectUri = "http://localhost:8090/auth/kakao/callback";

		// POST방식으로key=value 데이터를 요청(카카오쪽으로)
		// Retrofit2, OkHttp, RestTemplate
		RestTemplate rt = new RestTemplate();

		// HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", contentType);

		// HttpBody 객체 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", grantType);
		params.add("client_id", clientId);
		params.add("redirect_uri", redirectUri);
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenReq = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoTokenReq, String.class);
	}

	@Override
	public KakaoOauthTokenDTO getKakaoTokenObject(ResponseEntity<String> kakaoResponseEntity) {
		// Gson, Json simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();

		KakaoOauthTokenDTO kakaoOauthToken = null;

		try {
			kakaoOauthToken = objectMapper.readValue(kakaoResponseEntity.getBody(), KakaoOauthTokenDTO.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return kakaoOauthToken;
	}

	@Override
	public ResponseEntity<String> getKakaoMemberInfoEntity(String accessToken) {
		String authorization = "Bearer";
		String contentType = "application/x-www-form-urlencoded;charset=utf-8";

		RestTemplate rt = new RestTemplate();

		// HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization + " " + accessToken);
		headers.add("Content-type", contentType);
		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileReq = new HttpEntity<>(headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoProfileReq, String.class);
	}

	@Override
	public KakaoProfileDTO getKakaoProfileObject(ResponseEntity<String> kakaoMemberInfoEntity) {
		ObjectMapper objectMapper = new ObjectMapper();
		KakaoProfileDTO kakaoProfile = null;

		try {
			kakaoProfile = objectMapper.readValue(kakaoMemberInfoEntity.getBody(), KakaoProfileDTO.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return kakaoProfile;
	}

	@Override
	public int saveKakaoMemberIntoDb(KakaoProfileDTO kakaoProfile) {
		// TestUserDTO : member_id, member_password, member_birthday, member_nickname,
		// member_email
		TestUserDTO member = TestUserDTO.builder().member_id("kakao_" + kakaoProfile.getId())
				.member_password(UUID.randomUUID().toString())
				//.member_birthday(Date.valueOf(kakaoProfile.getKakao_account().birthday))
				.member_nickname(kakaoProfile.getProperties().nickname)
				.member_email(kakaoProfile.getKakao_account().email).build();
		
		return loginMapper.insertOauthMember(member);
	}

	@Override
	public TestUserDTO checkIfMemberExists(String memberEamil) {
		return loginMapper.findByMemberEmail(memberEamil);
	}

}
