package com.team.webproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.webproject.dto.KakaoOauthTokenDTO;
import com.team.webproject.dto.KakaoProfileDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.NaverOauthTokenDTO;
import com.team.webproject.dto.NaverProfileDTO;
import com.team.webproject.dto.OAuthPropertiesDTO;
import com.team.webproject.mapper.OAuthMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OAuthServiceImpl implements OAuthService {

	private final OAuthMapper oauthMapper;
	private final OAuthPropertiesDTO oauthProperties;
	
	// 카카오 로그인 관련 로직
	@Override
	public ResponseEntity<String> getKakaoIssueTokenEntity(String code) {
		
		// POST방식으로key=value 데이터를 요청(카카오쪽으로)
		// Retrofit2, OkHttp, RestTemplate
		RestTemplate rt = new RestTemplate();

		// HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", oauthProperties.getKakaoContentType());

		// HttpBody 객체 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", oauthProperties.getKakaoGrantType());
		params.add("client_id", oauthProperties.getKakaoClientId());
		params.add("redirect_uri", oauthProperties.getKakaoRedirectUri());
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenReq = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange(
						oauthProperties.getKakaoTokenUri(),
						HttpMethod.POST,
						kakaoTokenReq,
						String.class
						);
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

		RestTemplate rt = new RestTemplate();

		// HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", oauthProperties.getKakaoAuthorization() + " " + accessToken);
		headers.add("Content-type", oauthProperties.getKakaoContentType());
		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileReq = new HttpEntity<>(headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange(
						oauthProperties.getKakaoUserUri(),
						HttpMethod.POST,
						kakaoProfileReq,
						String.class
						);
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
	public int saveKakaoMemberIntoDB(KakaoProfileDTO kakaoProfile) {

		MembersDTO member = MembersDTO.builder()
				.member_id("kakao_" + kakaoProfile.getId())
				.member_pwd(oauthProperties.getPassword())
				.member_birth(kakaoProfile.getKakao_account().getBirthday())
				.member_name(kakaoProfile.getProperties().getNickname())
				.member_email(kakaoProfile.getKakao_account().getEmail())
				.build();

		return oauthMapper.insertOauthMember(member);
	}
	
	@Override
	public ResponseEntity<String> getNaverIssueTokenEntity(String code, String state) {
		
		RestTemplate rt = new RestTemplate();

		// HttpBody 객체 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", oauthProperties.getNaverGrantType());
		params.add("client_id", oauthProperties.getNaverClientId());
		params.add("client_secret", oauthProperties.getNaverClientSecret());
		params.add("code", code);
		params.add("state", state);

		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> naverTokenReq = new HttpEntity<>(params, new HttpHeaders());

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange(
						oauthProperties.getNaverTokenUri(),
						HttpMethod.POST,
						naverTokenReq,
						String.class
						);

	}

	@Override
	public NaverOauthTokenDTO getNaverTokenObject(ResponseEntity<String> naverIssueTokenEntity) {
		ObjectMapper objectMapper = new ObjectMapper();

		NaverOauthTokenDTO NaverOauthToken = null;

		try {
			NaverOauthToken = objectMapper.readValue(naverIssueTokenEntity.getBody(), NaverOauthTokenDTO.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return NaverOauthToken;
	}

	@Override
	public ResponseEntity<String> getNaverMemberInfoEntity(String accessToken) {

		RestTemplate rt = new RestTemplate();

		// HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", oauthProperties.getNaverAuthorization() + " " + accessToken);
		// HttpHeader와 HttpBody를 하나의 객체 담기
		HttpEntity<MultiValueMap<String, String>> naverProfileReq = new HttpEntity<>(headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답 받음.
		return rt.exchange(
						oauthProperties.getNaverUserUri(),
						HttpMethod.POST,
						naverProfileReq,
						String.class
						);
	}

	@Override
	public NaverProfileDTO getNaverProfileObject(ResponseEntity<String> naverMemberInfoEntity) {

		ObjectMapper objectMapper = new ObjectMapper();

		NaverProfileDTO naverProfile = null;

		try {
			naverProfile = objectMapper.readValue(naverMemberInfoEntity.getBody(), NaverProfileDTO.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return naverProfile;
	}

	@Override
	public int saveNaverMemberIntoDB(NaverProfileDTO naverProfile) {
		MembersDTO member = MembersDTO.builder()
				.member_id(("naver_" + naverProfile.getResponse().getId()))
				.member_pwd(oauthProperties.getPassword())
				.member_birth(naverProfile.getResponse().getBirthday())
				.member_name(naverProfile.getResponse().getNickname())
				.member_email(naverProfile.getResponse().getEmail())
				.build();

		return oauthMapper.insertOauthMember(member);
	}

	@Override
	public MembersDTO checkIfMemberExists(String memberId) {
		return oauthMapper.findByMemberId(memberId);
	}

	@Override
	public HttpSession getSessionIncludingMemberId(HttpServletRequest request, String memberId) {
		HttpSession session = request.getSession();
		session.setAttribute("member_id", memberId);
		return session;
	}

	@Override
	public MembersDTO getMember(String memberId) {
		return oauthMapper.findByMemberId(memberId);
	}
}
