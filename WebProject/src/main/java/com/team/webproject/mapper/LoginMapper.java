package com.team.webproject.mapper;

import com.team.webproject.dto.AdminDTO;
import com.team.webproject.dto.MembersDTO;

public interface LoginMapper {
	
	public void memberJoin(MembersDTO member);
	
	int add(MembersDTO login);
	
}
