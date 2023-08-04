package com.team.webproject.mapper;

import java.sql.Date;
import java.util.List;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MembersDTO_findId;

public interface LoginMapper {
	
	public Integer checkId(String id);

	public MembersDTO checklogin(String id);
	
	int add(MembersDTO login);

	public List<MembersDTO> getAll();

	public boolean equalPwd(MembersDTO_findId member);	

	public MembersDTO FindId(String name, Date c_birth, String phone);
	
	public MembersDTO FindPwd(String Id, String name, Date birth, String phone);
	
	String getId(MembersDTO_findId member);
	

}