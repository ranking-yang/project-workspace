
package com.team.webproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
//	private final Password password;
	private final LoginMapper loginMapper;
	
//	// 회원가입 및 로그인 서비스 시작
//	@Override
//	public String checkId(MembersDTO member, String member_pwd_verify) {
//		
//		if (loginMapper.checkId(member) > 0) {
//			System.out.println("아이디 중복, 회원가입 실패");
//			return "redirect:/new-Join";
//		} else if (member.getMember_pwd().equals(member_pwd_verify)) {
//			add(member);
//			System.out.println("회원가입 성공");
//			return "redirect:/login";
//		}
//		System.out.println("실패");
//		return "redirect:/new-join";
//	}
	
	@Override
	public Integer checkId(String id) {
		
		Integer num = loginMapper.checkId(id);
		return num;
		
	}
//		
//		if (loginMapper.checkId(member) > 0) {
//			System.out.println("아이디 중복, 회원가입 실패");
//			return "redirect:/new-Join";
//		} else if (member.getMember_pwd().equals(member_pwd_verify)) {
//			add(member);
//			System.out.println("회원가입 성공");
//			return "redirect:/login";
//		}
//		System.out.println("실패");
//		return "redirect:/new-join";
//	}
	
	@Override
	public boolean login(MembersDTO member, HttpServletRequest httpServletRequest) {
		List<MembersDTO> allMembers =  loginMapper.getAll();
		for (MembersDTO mem : allMembers) {
			if (member.getMember_id().equals(mem.getMember_id())
					&& member.getMember_pwd().equals(mem.getMember_pwd())) {
				
				System.out.println("로그인 성공");
//				httpServletRequest.getSession().invalidate();
//			    HttpSession session = httpServletRequest.getSession(true);
//			    
//			    session.setAttribute("userId", member.getMember_id());
				return true;
			}
		}
		System.out.println("로그인 실패");
		return false;
	}
	

	@Override
	public int add(MembersDTO login) {
//		login.setMember_pwd(password.hashPassword(login.getMember_pwd()));
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
}