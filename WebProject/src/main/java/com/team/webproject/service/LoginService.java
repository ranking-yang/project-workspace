package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.Errors;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.repository.MemberDao;

public interface LoginService {
	
	// 회원가입 및 로그인 서비스 시작
//	String checkId(MembersDTO member, String member_pwd_verify);
	Integer checkId(String id);
	
	boolean login(MembersDTO member);
	
	int add(MembersDTO member);
	
	public Map<String, String> validateHandling(Errors errors);
	
	List<MembersDTO> getAll();
	// 회원가입 및 로그인 서비스 끝
	
}