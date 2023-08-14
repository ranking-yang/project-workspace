
package com.team.webproject.service;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService, UserDetailsService{

	private final LoginMapper loginMapper;
	private final PasswordEncoder passwordEncoder;

	// 중복체크
	@Override
	public Integer checkId(String id) {
		System.out.println("check?:"+ id);
		Integer num = loginMapper.checkId(id);
		return num;
		
	}
	
	@Override
	public int add(MembersDTO member) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));
		member.setMember_role("member");
		System.out.println(member.toString());
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
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
    	MembersDTO member = loginMapper.checklogin(member_id);
    	System.out.println("load >>>>>>>>>>>>>>>>>> "+member.toString());
        if (member == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        String pw = member.getMember_pwd();
        String roles = member.getMember_role();

        return User.builder()
                .username(member_id)
                .password(pw)
                .roles(roles)
                .build();
    }

	
	
	// 회원가입 및 로그인 서비스 끝
}