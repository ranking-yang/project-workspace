//package com.team.webproject.service;
//
//import java.util.HashSet;
//import java.util.Set;
// 
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.team.webproject.domain.Member;
//import com.team.webproject.repository.UserRepository;
//
//import lombok.AllArgsConstructor;
// 
//@Service
//@AllArgsConstructor
//public class CustomUserDetailsService implements UserDetailsService {
// 
//	private final UserRepository userRepository;
// 
//	@Override
//	@Transactional(readOnly = true)
//	public UserDetails loadUserByUsername(String id) {
// 
//		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
// 
//		Member user = userRepository.findOneById(id);
// 
//		if (user != null) {
//			grantedAuthorities.add(new SimpleGrantedAuthority("USER")); // USER 라는 역할을 넣어준다.
//			return new User(user.getMember_id(), user.getMember_pwd(), grantedAuthorities);
//		} else {
//			throw new UsernameNotFoundException("can not find User : " + id);
//		}
//	}
//	
//}