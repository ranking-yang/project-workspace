package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.validation.Errors;

import com.team.webproject.dto.MembersDTO;

public interface ExampleService {
	
	// 회원가입 및 로그인 서비스 시작
	void memberJoin(MembersDTO member) throws Exception;
	int add(MembersDTO login);
	
	public Map<String, String> validateHandling(Errors errors);
	
	List<MembersDTO> getAll();
	// 회원가입 및 로그인 서비스 끝
	int checkId(MembersDTO member);
	boolean equalPwd(MembersDTO member, String member_pwd_verify);
	boolean login(MembersDTO member, HttpServletResponse response);
	void logout(HttpServletResponse response);
	
}
