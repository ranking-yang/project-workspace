
package com.team.webproject.service;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ExampleServiceImpl implements ExampleService {
	
	private final LoginMapper loginMapper;

	@Override
	public void memberJoin(MembersDTO member) throws Exception {
		
		loginMapper.memberJoin(member);
		
	}
	
	@Override
	public int add(MembersDTO login) {
		
		loginMapper.add(login);
		
		return 0;
	}
 
}

