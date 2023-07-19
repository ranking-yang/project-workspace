package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.Example;
import com.team.webproject.dto.LoginDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.ExampleMapper;
import com.team.webproject.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ExampleServiceImpl implements ExampleService {
	
	private final ExampleMapper exMapper;
	private final LoginMapper loginMapper;
	
	@Override
	public List<Example> getAll() {

		return exMapper.getAll();
	}
	
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
