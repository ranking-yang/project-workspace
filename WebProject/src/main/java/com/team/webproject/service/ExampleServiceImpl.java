
package com.team.webproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

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
	
	@Override
	public List<MembersDTO> getAll() {
		return loginMapper.getAll();
	}
	
	@Override
	public int checkId(MembersDTO member) {
		return loginMapper.checkId(member);
	}
	
//	@Override
//	public boolean login(MembersDTO member) {
//		List<MembersDTO> allMembers =  loginMapper.getAll();
//		for (MembersDTO mem : allMembers) {
//			if (member.getMember_id().equals(mem.getMember_id())
//					&& member.getMember_pwd().equals(mem.getMember_pwd())) {
//				
//				return true;
//			}
//		}
//		return false;
//	}
	
	@Override
	public boolean equalPwd(MembersDTO member, String member_pwd_verify) {
		if (member.getMember_pwd().equals(member_pwd_verify)) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean login(MembersDTO member, HttpServletResponse response) {
		List<MembersDTO> allMembers =  loginMapper.getAll();
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
	// 회원가입 및 로그인 서비스 끝
}

