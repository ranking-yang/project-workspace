package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.AdminDTO;
import com.team.webproject.dto.MembersDTO;

public interface LoginMapper {
	
	public int checkId(MembersDTO member);
	
	public void login(MembersDTO member);
	
	int add(MembersDTO login);

	public List<MembersDTO> getAll();

	public boolean equalPwd(MembersDTO member);
	
}
