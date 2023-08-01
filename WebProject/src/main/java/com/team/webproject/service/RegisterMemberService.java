package com.team.webproject.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.repository.MemberDao;

import lombok.RequiredArgsConstructor;
 
@Service
@RequiredArgsConstructor
public class RegisterMemberService {
 
	private final MemberDao userRepository;
 
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
 
	public void insert(MembersDTO membersDto) {
		membersDto.setMember_pwd(bCryptPasswordEncoder.encode(membersDto.getMember_pwd()));
		userRepository.save(membersDto.toEntity("ROLE_USER"));
	}
}
