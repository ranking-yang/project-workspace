package com.team.webproject.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.MembersDTO;

public interface CustomUserDetailsMapper {

	MembersDTO getMemberInfo(@Param("member_id") String member_id);
	
}
