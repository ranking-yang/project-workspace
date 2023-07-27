package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TestUserDTO;

public interface LoginMapper {
	
	public int checkId(MembersDTO member);
	
	public void login(MembersDTO member);
	
	int add(MembersDTO login);

	public List<MembersDTO> getAll();

	public boolean equalPwd(MembersDTO member);
	
	// 카카오 관련 sql매핑
	int insertOauthMember(TestUserDTO testUser);
	TestUserDTO findByMemberEmail(@Param("email")String memberEmail);
}
