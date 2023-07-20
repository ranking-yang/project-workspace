
package com.team.webproject.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.team.webproject.dto.AdminDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ExampleServiceImpl implements ExampleService {
	
	private final LoginMapper loginMapper;
	
	// 회원가입 및 로그인 서비스 시작
	@Override
	public void memberJoin(MembersDTO member) throws Exception {
		
		loginMapper.memberJoin(member);
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
	// 회원가입 및 로그인 서비스 끝
}

