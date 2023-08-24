
package com.team.webproject.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService, UserDetailsService{

	private final LoginMapper loginMapper;

	// 중복체크
	@Override
	public Integer checkId(String id) {
		Integer num = loginMapper.checkId(id);
		return num;
	}
	
	@Override
	public int add(MembersDTO member) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));
		member.setMember_role("member");
		loginMapper.add(member);
		return 0;
	}
	
	// 회원가입 필터링 결과 표출 형식(valid_%s)
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
	public MembersDTO getMember(String id) {
		MembersDTO member = loginMapper.checklogin(id);
		return member;
	}



	@Override
	public MembersDTO findId(String name, String birth, String Phone) {
		DateChange dateChange = new DateChange();
		Date c_birth = dateChange.transformDate3(birth);
		MembersDTO member = loginMapper.FindId(name, c_birth, Phone);
		return member;
	}



	@Override
	public MembersDTO findPw(String id, String name, String birth, String Phone) {
		DateChange dateChange = new DateChange();
		Date c_birth = dateChange.transformDate3(birth);
		MembersDTO member = loginMapper.FindPwd(id, name, c_birth, Phone);
		return member;
	}


    @Override
    public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {    
    	MembersDTO member = loginMapper.checklogin(member_id);
        if (member == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        return member;
    }

	@Override
	public Map<String, Integer> month_join() {
		
		Map<String, Integer> month_join = new HashMap<String, Integer>();
		for(int i=1; i<=12; i++) {
			Integer sales = 0;
			for(MembersDTO member : loginMapper.getAll()) {
				if(member.getJoin_date().getMonth()+1 == i) {
					 int currentCount = month_join.getOrDefault(i+"월", 0);
					 month_join.put(i+"월", currentCount + 1); 
				}
			}
		}
		  
		return month_join;
		
	}

	
	
	// 회원가입 및 로그인 서비스 끝
}