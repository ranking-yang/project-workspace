
package com.team.webproject.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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

import com.team.webproject.domain.Member;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.repository.MemberDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService{
//	private final Password password;
	private final LoginMapper loginMapper;
	private final PasswordEncoder passwordEncoder;
	@Autowired
    private MemberDao memberDao;
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
	
//	@Override
//	@Transactional(readOnly = true)
//	public UserDetails loadUserByUsername(String id) {
// 
//		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
// 
//		Member member = memberDao.findOneById(id);
//		
//		if (member != null) {
//			grantedAuthorities.add(new SimpleGrantedAuthority("USER")); // USER 라는 역할을 넣어준다.
//			return MemberDTO(member.getMember_id(), member.getMember_pwd(), grantedAuthorities);
//		} else {
//			throw new UsernameNotFoundException("can not find User : " + id);
//		}
//	}
	private final MemberDao userRepository;
	 
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public boolean login(MembersDTO member) {
		List<MembersDTO> allMembers =  loginMapper.getAll();
		for (MembersDTO mem : allMembers) {
			if (member.getMember_id().equals(mem.getMember_id())
					&& passwordEncoder.matches(member.getMember_pwd(), mem.getMember_pwd())){
				
				
				System.out.println("로그인 성공");
				return true;
			}
		}
		System.out.println("로그인 실패");
		return false;
	}
	

	@Override
	public int add(MembersDTO member) {
//		member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));
		
		member.setMember_pwd(bCryptPasswordEncoder.encode(member.getMember_pwd()));
		userRepository.save(member.toEntity("ROLE_USER"));
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

	// 회원가입 및 로그인 서비스 끝
}