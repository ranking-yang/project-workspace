package com.team.webproject.service;

import java.util.Map;

import org.springframework.validation.Errors;

import com.team.webproject.dto.AdminDTO;
import com.team.webproject.dto.MembersDTO;

public interface ExampleService {
	
	// 회원가입 및 로그인 서비스 시작
	void memberJoin(MembersDTO member) throws Exception;
	int add(MembersDTO login);
	
	public Map<String, String> validateHandling(Errors errors);
	
	// 회원가입 및 로그인 서비스 끝
	
}
