
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

//import com.team.webproject.domain.Member;
import com.team.webproject.dto.MembersDTO;

import com.team.webproject.mapper.LoginMapper;
//import com.team.webproject.repository.MemberDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService{

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
	public MembersDTO login(MembersDTO member, HttpServletRequest request) {
		System.out.println("member check?:"+ member);
		MembersDTO Members =  loginMapper.checklogin(member.getMember_id());
		request.getSession().invalidate();
        HttpSession session = request.getSession(true);  // Session이 없으면 생성
		if (member.getMember_id().equals(Members.getMember_id())
				&& passwordEncoder.matches(member.getMember_pwd(), Members.getMember_pwd())){
				System.out.println(Members.toString());
				System.out.println("로그인 성공");
				
				session.setAttribute("userId", Members.getMember_id());
				session.setAttribute("userCode", Members.getMember_code());
				return Members;
			
		}
		System.out.println("로그인 실패");
		return null;
	}
	
	
	
	@Override
	public int add(MembersDTO member) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));
		member.setMember_role("user");
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
		System.out.println("id???");
		DateChange dateChange = new DateChange();
		Date c_birth = dateChange.transformDate3(birth);
		MembersDTO member = loginMapper.FindId(name, c_birth, Phone);
		System.out.println("이게 안됨.");
		return member;
	}



	@Override
	public MembersDTO findPw(String id, String name, String birth, String Phone) {
		System.out.println("pw???");
		DateChange dateChange = new DateChange();
		Date c_birth = dateChange.transformDate3(birth);
		MembersDTO member = loginMapper.FindPwd(id, name, c_birth, Phone);
		return member;
	}
	
	
	
	
//    @Override
//    public MembersDTO loadUserByUsername(String userId) throws UsernameNotFoundException {
//        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
//    	MembersDTO member = loginMapper.checklogin(userId);
//        if (member == null){
//            throw new UsernameNotFoundException("User not authorized.");
//        }
//        return member;
//    }
	

	// 회원가입 및 로그인 서비스 끝
}