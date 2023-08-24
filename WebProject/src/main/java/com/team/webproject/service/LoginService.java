package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.validation.Errors;

import com.team.webproject.dto.MembersDTO;

public interface LoginService {
	
	// 회원가입 및 로그인 서비스 시작
	Integer checkId(String id);
	
	int add(MembersDTO member);
	
	public Map<String, String> validateHandling(Errors errors);
	
	List<MembersDTO> getAll();
	// 회원가입 및 로그인 서비스 끝
	
	Map<String, Integer> month_join();
	
	MembersDTO getMember(String id);
	
	MembersDTO findId(String name, String birth, String Phone);
	
	MembersDTO findPw(String id, String name, String birth, String Phone);

}